export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="geoffgarside"
#ZSH_THEME="agnoster"

plugins=(git)

export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

set -o vi

alias rs_up='rails s -b 0.0.0.0 -p 3001'

# git aliases
alias gpr='git pull --rebase'
alias gbrd='git branch | grep -v "master\|development" | sed "s/^[ *]*//" | sed "s/^/git branch -D /" | bash'
alias gsp='g stash pop'
alias gs='g stash -u'

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

alias myip='curl ifconfig.co'

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q -f)'

export PATH="$PATH:$HOME/Downloads/geckodriver"

export GOPATH=$HOME/projects/golang
bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

DISABLE_AUTO_TITLE="true"

alias iex='rlwrap -a foo iex'
alias t='tmux'

# docker aliases
alias d='docker'
alias dcs='docker-compose'
alias dcup='docker-compose up -d'
alias dsc='d stop $(d ps -a -q)'
alias dkc='d rm $(d ps -a -q)'
alias dri='d rmi $(d images -a -q) -f'

alias rc='rspec'

export NVM_DIR="$HOME/.nvm"

function load_nvm() {
  source ~/.nvm/nvm.sh
  return
}
# load nvm, npm and node when necessary
alias nvm='lazy_load_cmd nvm'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

function cmd_exists () {
  whence -w nvm | grep 'command\|function'
  return
}

function lazy_load_cmd() {
  if ! cmd_exists $1; then
    unalias $1
    "load_$1"
    eval $1
  fi
  return
}

function is_node_command() {
  whence -w $1 | grep 'node\|npm\|nvm'
  return
}

function preexec_node() {
  if is_node_command $1; then
    lazy_load_cmd nvm &> /dev/null
    eval $1
  fi
  return
}

function kill_batch_of_ps() {
  ps aux | grep $1 | echo $1
  kill -9 $(ps aux | grep $1 | grep -v 'grep' | awk '{print $2}')
}
