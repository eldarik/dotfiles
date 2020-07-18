# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/eldar_iskhakov/.fzf/bin* ]]; then
  # for linux
  # export PATH="${PATH:+${PATH}:}/home/eldar/.fzf/bin"
  # for mac os
  export PATH="${PATH:+${PATH}:}/Users/eldar_iskhakov/.fzf/bin"
fi

# Auto-completion
# ---------------
# for linux
# [[ $- == *i* ]] && source "/home/eldar/.fzf/shell/completion.zsh" 2> /dev/null
# for mac os
[[ $- == *i* ]] && source "/Users/eldar_iskhakov/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# for linux
# source "/home/eldar/.fzf/shell/key-bindings.zsh"
# for mac os
source "/Users/eldar_iskhakov/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_OPTS='
 --color=bg+:7,bg:15,spinner:2,hl:2,fg:11,header:14,info:9,pointer:2,marker:2,fg+:11,prompt:2,hl+:2
'
# create fzf.zsh.dark and fzf.zsh.light for themes changing
# solarized light
# --color=bg+:7,bg:15,spinner:2,hl:2,fg:11,header:14,info:9,pointer:2,marker:2,fg+:11,prompt:2,hl+:2
# solarized dark
# --color=bg+:0,bg:8,spinner:2,hl:2,fg:12,header:10,info:9,pointer:2,marker:2,fg+:12,prompt:2,hl+:2
#
