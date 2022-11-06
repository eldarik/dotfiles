if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

source ~/.asdf/asdf.fish

source ~/.fzf/shell/key-bindings.fish
fzf_key_bindings
set -gx FZF_DEFAULT_OPTS '--color=bg+:7,bg:15,spinner:2,hl:2,fg:11,header:14,info:9,pointer:2,marker:2,fg+:11,prompt:2,hl+:2 --preview-window noborder'

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
