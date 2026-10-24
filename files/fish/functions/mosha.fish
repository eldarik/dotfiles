function mosha --description "mosh with a live forwarded ssh-agent"
    # --cmd runs something other than a login shell on the far end, e.g.
    # `--cmd "tmux new-session -A -s mosaic"`. --ignore-unknown is what keeps
    # the rest of the contract intact: every flag mosh owns stays in $argv, in
    # order, so argv[1] is still the target and argv[2..-1] still mosh's opts.
    argparse --ignore-unknown 'cmd=' -- $argv
    or return 1

    if test (count $argv) -eq 0
        echo "usage: mosha [--cmd <remote command>] <[user@]host> [extra mosh opts...]" >&2
        return 1
    end

    if not ssh-add -l >/dev/null 2>&1
        echo "mosha: no keys in the local agent (ssh-add -l failed)" >&2
        return 1
    end

    set -l target $argv[1]
    set -l moshopts $argv[2..-1]

    # Carrier: holds a real forwarded agent socket open on the remote box and
    # parks it at a stable path, ~/.ssh/agent.sock. mosh forwards no agent of
    # its own - the ssh hop that starts mosh-server exits immediately and takes
    # its socket with it - so this connection is the only reason git over SSH
    # works inside the session. -T = no tty; the remote command is required,
    # because `ssh -A -N` forwards nothing (no session channel).
    #
    # Health is decided by probing the socket, not by pgrep: autossh stays up
    # while the socket behind it is dead, and a stale carrier then silently
    # shadows a good one. Killing first makes the restart unconditional.
    #
    # The payload parses the same under sh and fish, since the remote login
    # shell runs it. It resolves $SSH_AUTH_SOCK before pinning it, and refuses
    # to pin anything already under ~/.ssh: if the far end rewrites that
    # variable to one of its own stable paths (a fish conf.d snippet used to), a
    # blind `ln -sf` chains agent.sock to a per-login path, which then dangles
    # the moment any unrelated ssh session closes - taking the mosh session's
    # agent with it.
    if not mosha-carrier-ok $target
        pkill -f "autossh.*$target" >/dev/null 2>&1
        autossh -M 0 -f -A -T \
            -o ServerAliveInterval=15 \
            -o ServerAliveCountMax=3 \
            -o ExitOnForwardFailure=yes \
            $target \
            'mkdir -p ~/.ssh && test -S "$(readlink -f "$SSH_AUTH_SOCK")" && test "$(readlink -f "$SSH_AUTH_SOCK")" != "$HOME/.ssh/agent.sock" && ln -sfn "$(readlink -f "$SSH_AUTH_SOCK")" ~/.ssh/agent.sock && exec sleep infinity'
        or begin
            echo "mosha: carrier connection to $target failed" >&2
            return 1
        end
        sleep 1 # let the symlink land before mosh-server reads it

        if not mosha-carrier-ok $target
            echo "mosha: carrier is up but ~/.ssh/agent.sock on $target answers no agent" >&2
            return 1
        end
    end

    # Seed the theme before attaching. Mid-session flips arrive via the
    # client-*-theme hooks in tmux.conf, but nothing has fired yet on a fresh
    # connection and mosh will never let the box work it out for itself.
    # Seed the TARGET, not ~/.config/theme-push-hosts: this session's box must
    # come up right even when that list has never heard of it — vps-eu was
    # rebuilt without a line there and the whole mosh theme path died silently.
    # Mid-session flips still ride the list, so the host belongs there too.
    if test -x $HOME/.local/bin/theme-push-remote
        $HOME/.local/bin/theme-push-remote $target
    end

    # The remote command always exports the carrier's socket first, then execs,
    # so nothing lingers between mosh-server and the real process - and with
    # --cmd, detaching from tmux ends the mosh session instead of dropping into
    # a shell. Single-quoted on purpose: $HOME and ${SHELL} are for the remote
    # sh to expand, not fish.
    set -l remote 'export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock; exec '
    if set -q _flag_cmd
        set remote $remote$_flag_cmd
    else
        set remote $remote'${SHELL:-/bin/bash} -l'
    end

    mosh $moshopts $target -- sh -c $remote
end
