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
	mkdir -p ~/.config/ghostty/themes
	ln -sf $(PWD)/files/ghostty ~/.config/ghostty/config
	ln -sf $(PWD)/files/ghostty-themes/solarized-light ~/.config/ghostty/themes/solarized-light
	ln -sf $(PWD)/files/ghostty-themes/solarized-dark ~/.config/ghostty/themes/solarized-dark
	mkdir -p ~/.config/tmux
	ln -sf $(PWD)/files/tmux/light.conf ~/.config/tmux/light.conf
	ln -sf $(PWD)/files/tmux/dark.conf ~/.config/tmux/dark.conf
	mkdir -p ~/.local/bin
	chmod +x $(PWD)/files/bin/theme-toggle $(PWD)/files/bin/theme-mode $(PWD)/files/bin/tmux-theme-apply
	ln -sf $(PWD)/files/bin/theme-toggle ~/.local/bin/theme-toggle
	ln -sf $(PWD)/files/bin/theme-mode ~/.local/bin/theme-mode
	ln -sf $(PWD)/files/bin/tmux-theme-apply ~/.local/bin/tmux-theme-apply


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
