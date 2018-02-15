export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="geoffgarside"
#ZSH_THEME="agnoster"

plugins=(git bundler rails rake ruby zeus docker-compose boot2docker)

export PATH=$HOME/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=~/lib/x86_64-linux-gnu​​:$LD_LIBRARY_PATH

source $ZSH/oh-my-zsh.sh

set -o vi

alias rs_up='rails s -b 0.0.0.0 -p 3001'

alias gpr='git pull --rebase'
alias gbrd='git branch | grep -v "master" | sed "s/^[ *]*//" | sed "s/^/git branch -D /" | bash'

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

alias myip='curl ifconfig.co'

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

alias docker_clear_cache='docker kill $(docker ps -q);docker_clean_ps;docker rmi $(docker images -a -q)'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

export PATH="$PATH:$HOME/Downloads/geckodriver"

export GOPATH=$HOME/projects/golang
bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete

alias dkc='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)'

export PATH="$PATH:$HOME/projects/volt/volt-tools/git" # Add RVM to PATH for scripting

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
