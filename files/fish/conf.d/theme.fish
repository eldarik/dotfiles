# fzf palette follows the current appearance, live — in shells that are ALREADY open.
#
# FZF_DEFAULT_OPTS_FILE names a file that fzf re-reads on every invocation, so the
# variable itself is static and can never go stale. A flip only has to rewrite the
# file; nothing has to reach into running shells, so there is no signal handler, no
# prompt hook and no universal variable involved. theme-toggle and the tmux
# client-*-theme hooks both call fzf-theme to do the rewriting.
#
# The key-binding widgets (C-t / C-r / M-c) follow too: fzf's own __fzf_defaults
# inlines the file at widget invocation, not at shell start.
#
# The palette itself lives in files/bin/fzf-theme, the single source of truth.

# Drop any inherited FZF_DEFAULT_OPTS. fzf applies the file first and this second,
# so a leftover value silently wins over the file — and that is exactly what the
# old -gx-at-startup approach left behind. Long-lived parents predating this change
# (the tmux server, ghostty) keep exporting the old frozen palette into every shell
# they spawn, so erasing here is what makes the switchover self-healing instead of
# "restart everything". A universal one would survive this: `set -Ue FZF_DEFAULT_OPTS`.
set -e FZF_DEFAULT_OPTS

# Generate the file BEFORE pointing fzf at it, and only export on success: a
# FZF_DEFAULT_OPTS_FILE naming a missing file is not ignored — fzf exits 2 with an
# error on EVERY invocation — so this has to fail open (no variable, stock colors)
# rather than fail closed (fzf broken everywhere).
#
# This call is also the self-heal: it covers the first shell after boot, and any
# flip that happened while no tmux client was attached. Idempotent, and no more
# costly than the theme-mode call it replaced.
#
# Called by absolute path: conf.d/ is sourced before config.fish, so ~/.local/bin
# is not on PATH yet.
if $HOME/.local/bin/fzf-theme
    set -gx FZF_DEFAULT_OPTS_FILE $HOME/.cache/fzf-opts
else
    set -e FZF_DEFAULT_OPTS_FILE
end
