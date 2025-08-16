if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

source ~/.asdf/asdf.fish

source ~/.fzf/shell/key-bindings.fish
fzf_key_bindings
# solarized light
set -Ux FZF_DEFAULT_OPTS "
  --color=bg+:#eee8d5,fg:#657b83,hl:#b58900
  --color=fg+:#586e75,pointer:#859900,info:#268bd2
  --color=marker:#859900,spinner:#2aa198,prompt:#b58900
  --color=hl+:#cb4b16
"

# solarized dark
# set -gx FZF_DEFAULT_OPTS "
#   --color=bg+:#073642,fg:#839496,hl:#268bd2
#   --color=fg+:#839496,pointer:#b58900,info:#268bd2
#   --color=marker:#b58900,spinner:#859900,prompt:#2aa198
#   --color=hl+:#b58900
# "

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
