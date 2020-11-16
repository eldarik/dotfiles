include install-asdf.mk
include setup-macos.mk
include setup-ubuntu.mk
include setup-vpn.mk

install-oh-my-zsh:
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > install-zsh.sh
	sh install-zsh.sh

install-tmux-plugin-manager:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

setup-macos: install-brew \
	install-brew-packages \
	install-asdf \
	install-asdf-plugins \
	install-oh-my-zsh \
	copy-dotfiles

setup-ubuntu: install-apt-packages \
	install-tmux-plugin-manager \
	install-ansible \
	install-docker \
	install-docker-compose \
	install-oh-my-zsh \
	copy-dotfiles

install-ansible:
	pip3 install ansible --user

copy-dotfiles:
	cp files/bash_profile ~/.bash_profile
	cp files/bashrc ~/.bashrc
	cp files/zshrc ~/.zshrc
	cp files/aliases ~/.aliases
	cp files/inputrc ~/.inputrc
	cp files/gitconfig ~/.gitconfig
	cp files/gitignore_global ~/.gitignore_global
	cp files/tmux.conf ~/.tmux.conf
	cp files/fzf.zsh ~/.fzf.zsh
	mkdir .config/
	mkdir .config/nvim/
	cp files/init.vim ~/.config/nvim/
	cp files/coc-settings.json ~/.config/nvim/
