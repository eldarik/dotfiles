export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="geoffgarside"
#ZSH_THEME="agnoster"

plugins=(git)

#export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

set -o vi

alias rs_up='rails s -b 0.0.0.0 -p 3001'

# git aliases
alias gpr='git pull --rebase'
alias gbrd='git branch | grep -v "master\|development" | sed "s/^[ *]*//" | sed "s/^/git branch -D /" | bash'
alias gsp='g stash pop'
alias gs='g stash -u'

#NPM_PACKAGES="${HOME}/.npm-packages"
#
#PATH="$NPM_PACKAGES/bin:$PATH"
#
## Unset manpath so we can inherit from /etc/manpath via the `manpath` command
#unset MANPATH # delete if you already modified MANPATH elsewhere in your config
#export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

alias myip='curl ifconfig.co'

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q -f)'


export GOPATH=$HOME/projects/golang
bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

DISABLE_AUTO_TITLE="true"

alias iex='rlwrap -a foo iex'
alias t='tmux'
alias tat='tmux attach -t'

# docker aliases
alias d='docker'
alias dcs='docker-compose'
alias dcup='docker-compose up -d'
alias dsc='d stop $(d ps -a -q)'
alias dkc='d rm $(d ps -a -q)'
alias dri='d rmi $(d images -a -q) -f'

alias rc='rspec'

function kill_batch_of_ps() {
  ps aux | grep $1 | echo $1
  kill -9 $(ps aux | grep $1 | grep -v 'grep' | awk '{print $2}')
}

alias start_fanctrl='/Applications/Macs\ Fan\ Control.app/Contents/MacOS/MacsFanControl /minimized & disown'
alias stop_fanctrl='kill_batch_of_ps MacsFanControl'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias nvim='~/.local/nvim/bin/nvim'
alias old_vim='/usr/bin/vim'
alias vim='nvim'
alias v='nvim'

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

alias a='asdf'

export PATH="$PATH:$HOME/.local/bin"
alias ans=ansible
