install-asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf

install-asdf-plugins:
	asdf plugin-add elixir
	asdf plugin-add erlang
	asdf plugin-add golang
	asdf plugin-add python
	asdf plugin-add ruby
	asdf plugin add nodejs

install-asdf-nodejs:
	asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

install-asdf-ruby:
	asdf plugin-add ruby
	asdf install ruby latest
