export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="geoffgarside"

plugins=(git bundler rails rake ruby zeus docker-compose boot2docker)

export PATH=$HOME/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=~/lib/x86_64-linux-gnu​​:$LD_LIBRARY_PATH 
export RAILS_ENV=development
#export VIMCLOJURE_SERVER_JAR="$HOME/lib/vimclojure/server-2.3.6.jar"

source $ZSH/oh-my-zsh.sh

set -o vi

alias swcps="setxkbmap -option 'ctrl:nocaps'"
alias unswcps="setxkbmap -option 'ctrl:ctrl'"
alias vup='vagrant up'
alias vst='vagrant status'
alias vssh='vagrant ssh'
alias vhalt='vagrant halt'
alias vplugin='vagrant plugin'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias rs_up='rails s -b 0.0.0.0 -p 3001'

alias gpr='git pull --rebase'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias telegram='/opt/telegram/Telegram'

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias myip='curl ifconfig.co'
alias lk4b='perl ~/bin/lk4b.pl'

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

alias docker_clear_cache='docker kill $(docker ps -q);docker_clean_ps;docker rmi $(docker images -a -q)'
