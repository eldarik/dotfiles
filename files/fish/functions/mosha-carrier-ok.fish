function mosha-carrier-ok --description "true if <target> has a live forwarded agent at ~/.ssh/agent.sock"
    if test (count $argv) -ne 1
        echo "usage: mosha-carrier-ok <[user@]host>" >&2
        return 2
    end

    # Ask the far end whether the carrier's socket actually answers. A running
    # autossh process proves nothing: it stays up while the socket behind it is
    # dead, which is exactly the state that makes git inside a mosh session fail
    # with "Permission denied (publickey)".
    #
    # -a on purpose: the probe must not forward an agent of its own, or it would
    # be testing its own connection rather than the carrier's.
    ssh -a -o BatchMode=yes -o ConnectTimeout=5 $argv[1] \
        'SSH_AUTH_SOCK=$HOME/.ssh/agent.sock ssh-add -l' >/dev/null 2>&1
    set -l rc $status

    # 0 = keys listed, 1 = a live agent holding none, 2 = nothing listening.
    # 255 = ssh itself failed; not the carrier's fault, but not usable either.
    test $rc -ne 2
    and test $rc -ne 255
end
