install-asdf:
	 git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0
	echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
	echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile
	echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
	echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

install-asdf-plugins:
	asdf plugin-add elixir
	asdf plugin-add erlang
	asdf plugin-add golang

install-asdf-nodejs:
	asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

install-asdf-ruby:
	asdf plugin-add ruby
	asdf install ruby latest
