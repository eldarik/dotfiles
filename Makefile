include install-asdf.mk
include setup-macos.mk
include setup-ubuntu.mk

install-tmux-plugin-manager:
	- mkdir ~/.tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

setup-macos: install-brew \
	install-brew-packages \
	install-asdf \
	install-asdf-plugins \
	install-oh-my-zsh \
	sync-dotfiles

setup-ubuntu: install-apt-packages \
	install-tmux-plugin-manager \
	install-ansible \
	install-docker \
	install-docker-compose \
	install-oh-my-zsh \
	sync-dotfiles

install-ansible:
	pip3 install ansible --user

sync-dotfiles:
	ln -sf $(PWD)/files/bash_profile ~/.bash_profile
	ln -sf $(PWD)/files/bashrc ~/.bashrc
	ln -sf $(PWD)/files/zshrc ~/.zshrc
	ln -sf $(PWD)/files/aliases ~/.aliases
	ln -sf $(PWD)/files/inputrc ~/.inputrc
	ln -sf $(PWD)/files/gitconfig ~/.gitconfig
	ln -sf $(PWD)/files/gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/files/tmux.conf ~/.tmux.conf
	- mkdir -p ~/.config/bat/
	ln -sf $(PWD)/files/bat.config ~/.config/bat/config
	- mkdir -p ~/.config/karabiner/
	ln -sf $(PWD)/files/karabiner.json ~/.config/karabiner/
	ln -sf $(PWD)/files/alacritty.yml ~/.alacritty.yml
	ln -sf $(PWD)/files/fish ~/.config/fish
	mkdir -p ~/.config/wezterm
	ln -sf $(PWD)/files/wezterm.lua ~/.config/wezterm/wezterm.lua


PACKER_PATH=~/.local/share/nvim/site/pack/packer/start
nvim-configure:
	rm -rf nvim/plugin || exit 0
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0
	rm -rf $(PACKER_PATH) || exit 0
	mkdir -p ~/.config
	mkdir -p $(PACKER_PATH)
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(PACKER_PATH)/packer.nvim
	ln -snf $(PWD)/files/nvim ~/.config/nvim
