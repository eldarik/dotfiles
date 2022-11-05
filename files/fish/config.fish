if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish
source ~/.fzf/shell/key-bindings.fish
fzf_key_bindings

set -g fish_key_bindings fish_hybrid_key_bindings
set -g EDITOR nvim
set -g OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES # https://github.com/rails/rails/issues/38560
set -g FZF_DEFAULT_OPTS '--color=bg+:7,bg:15,spinner:2,hl:2,fg:11,header:14,info:9,pointer:2,marker:2,fg+:11,prompt:2,hl+:2 --preview-window noborder'

# aliases
# git
alias gpr='git pull --rebase'
alias gbrd='git branch | grep -v "master\|develop\|development|\main" | sed "s/^[ *]*//" | sed "s/^/git branch -D /" | bash'
alias gspop='git stash pop'
alias gspush='git stash push'
alias gsshow='git stash show'
alias gs='git stash -u'
alias ga='git add'
alias gap='git add -p'
alias gcom='git ci -m'
alias gmc='git merge --continue'
alias gp='git push origin "$(gsb)" -u'
alias gpf='git push origin "$(gsb)" -f'
alias grh='git reset HEAD'
# alias glc='git rev-parse HEAD'
alias glc='g log -n 1 --pretty=format:"%H"'
alias glcm='g log -n 1 --pretty=format:"%s"'
alias gdf='git diff'
alias gcia='git ci --amend'
alias gr='git rebase'
alias grm='git rebase master'
alias gri='git -c "rebase.instructionFormat=(%an <%ae>) %s" rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias grm='git rebase master'
alias gf='git fetch'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gnb='git checkout -b'
alias gco='git checkout'
alias gcb='gco $(git branch | fzf)'
alias gcrb='git checkout $(git branch -a | fzf | sed "s/.*remotes\/[a-z]*\///" | sed "s/ *//")'
alias gsb='git branch --show-current'
alias gst='git status'
alias gsh='git show'
alias gpwip="git add . && git ci -m 'wip [ci skip]' && gp"
alias gclf='git clean -f'

# tmux
alias t=tmux
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tks='tmux kill-server'

alias mk='make'
alias cl='clear'
alias myip='curl -4 ifconfig.co'

# docker
alias dsc='docker stop $(d ps -a -q)'
alias dkc='docker rm $(d ps -a -q)'
alias dpsf='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Networks}}\t"'
alias dps='docker ps | cut -c-$(tput cols)'
alias dpsa='docker ps -a'
alias dis="docker images --format '{{.Size}}\t{{.Repository}}:{{.Tag}}\t{{.ID}}' | sort -h | column -t"
alias de='docker exec -it'
alias dr='docker run -it'

# docker compose
alias dc=docker compose
alias dcup='docker compose up -d'
alias dce='docker compose exec'
alias dcl='docker compose log'

# only for moteefe project
alias moteefe_bd='dc run -p 3000:3000 web bash'

alias a=asdf
alias ans=ansible

# vim & nvim
alias v='nvim'

# better cat
alias orcat=cat
alias cat=bat

# ruby & rails
alias bi='bundle install'
alias b='bundle exec'
alias brs='bundle exec rails s -b 0.0.0.0'
alias brsp='bundle exec rspec'
alias br='bundle exec rails'
alias brc='bundle exec rails c'
alias brdb='bundle exec rails db'
alias brdm='bundle exec rails db:migrate'
alias brgm='bundle exec rails g migration'
alias bcpd='bundle exec cap production deploy'
alias bcbd='bundle exec cap beta deploy'

# node & npm & yarn
alias nr='npm run'
alias ni='npm install'
alias nrb='npm run build'
alias y=yarn
alias yi='yarn install'

# elixir & mix
alias i='iex'
alias ips='iex -S mix phx.server'
alias ism='iex -S mix'
alias m='mix'
alias mab='mix archive.build'
alias mai='mix archive.install'
alias mat='mix app.tree'
alias mc='mix compile'
alias mcf='mix compile --force'
alias mcv='mix compile --verbose'
alias mcl='mix clean'
alias mca='mix do clean, deps.clean --all'
alias mco='mix coveralls'
alias mcoh='mix coveralls.html'
alias mdoc='mix docs'
alias mdl='mix dialyzer'
alias mdlp='mix dialyzer --plt'
alias mcr='mix credo'
alias mcrs='mix credo --strict'
alias mcx='mix compile.xref'
alias mdc='mix deps.compile'
alias mdg='mix deps.get'
alias mdgc='mix do deps.get, deps.compile'
alias mdu='mix deps.update'
alias mdt='mix deps.tree'
alias mdua='mix deps.update --all'
alias mdun='mix deps.unlock'
alias mduu='mix deps.unlock --unused'
alias meb='mix escript.build'
alias mec='mix ecto.create'
alias mecm='mix do ecto.create, ecto.migrate'
alias med='mix ecto.drop'
alias mem='mix ecto.migrate'
alias megm='mix ecto.gen.migration'
alias merb='mix ecto.rollback'
alias mers='mix ecto.reset'
alias mes='mix ecto.setup'
alias mge='mix gettext.extract'
alias mgem='mix gettext.extract --merge'
alias mgm='mix gettext.merge priv/gettext'
alias mho='mix hex.outdated'
alias mlh='mix local.hex'
alias mn='mix new'
alias mns='mix new --sup'
alias mpd='mix phx.digest'
alias mpgc='mix phx.gen.channel'
alias mpgh='mix phx.gen.html'
alias mpgj='mix phx.gen.json'
alias mpgm='mix phx.gen.model'
alias mpgs='mix phx.gen.secret'
alias mpn='mix phx.new'
alias mpr='mix phx.routes'
alias mps='mix phx.server'
alias mr='mix run'
alias mrnh='mix run --no-halt'
alias mrl='mix release'
alias mt='mix test'
alias mtc='mix test --cover'
alias mtf='mix test --failed'
alias mts='mix test --stale'
alias mtw='mix test.watch'
alias mx='mix xref'
alias mf='mix format'
