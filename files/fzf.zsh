# Setup fzf
# ---------
if [[ ! "$PATH" == */home/eldar/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/eldar/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eldar/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/eldar/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_OPTS='
  --color=bg+:0,bg:8,spinner:2,hl:2,fg:12,header:10,info:9,pointer:2,marker:2,fg+:12,prompt:2,hl+:2
'
