if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

fish_add_path --prepend $HOME/.asdf/shims

source ~/.asdf/asdf.fish

source ~/.fzf/shell/key-bindings.fish
fzf_key_bindings
# FZF_DEFAULT_OPTS is set per light/dark in conf.d/theme.fish

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
