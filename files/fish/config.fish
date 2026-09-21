if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

# Homebrew. This lived in fish_user_paths until that file stopped being tracked;
# keep it here so a fresh checkout brings brew back on its own. Must run before
# anything below that probes for a brew-installed tool (fzf, nvim).
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

# --move: brew shellenv prepends /opt/homebrew/bin, and asdf's shims have to win
# over it for node/python3/ruby/yarn.
fish_add_path --move --prepend $HOME/.asdf/shims

source ~/.asdf/asdf.fish

# fzf ships its own bindings + completions; this replaces the old ~/.fzf checkout.
# fish_user_key_bindings re-invokes fzf_key_bindings after fish_hybrid_key_bindings.
# The palette comes from FZF_DEFAULT_OPTS_FILE, set in conf.d/theme.fish.
# Guarded so a fresh machine (dotfiles synced before brew packages) starts quietly.
type -q fzf; and fzf --fish | source

set -g fish_key_bindings fish_hybrid_key_bindings
set -gx EDITOR nvim
set -gx OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES # https://github.com/rails/rails/issues/38560

. ~/.aliases
if test -e ~/gdrive/notes/dev/aliases
  . ~/gdrive/notes/dev/aliases
end

if test -e ~/gdrive/notes/dev/env_vars.fish
  . ~/gdrive/notes/dev/env_vars.fish
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

set fish_cursor_default block
set fish_cursor_insert block
set fish_cursor_replace_one block
set fish_cursor_visual block
set fish_cursor_unknown block
export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity
fish_add_path /Users/eldar/.antigravity/antigravity/bin

# pnpm
set -gx PNPM_HOME "/Users/eldar/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
