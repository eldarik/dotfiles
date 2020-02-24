setup-ubuntu: install-apt-packages \
	install-tmux-plugin-manager \
	install-ansible \
	install-docker \
	install-docker-compose \
	install-oh-my-zsh \
	copy-ubuntu-dotfiles

install-apt-packages:
	sudo apt update -y -qq && \
		sudo apt upgrade -y -qq && \
		sudo apt install -y -qq \
			make \
			git \
			wget \
			zsh \
			mosh \
			python3 \
			python3-pip \
			python3-setuptools \
			tmux \
			linux-image-generic-hwe-18.04 \
			linux-headers-generic-hwe-18.04 \
			libssl-dev \
			libreadline-dev \
			zlib1g-dev \
			autoconf \
			bison \
			build-essential \
			libyaml-dev \
			libreadline-dev \
			libncurses5-dev \
			libffi-dev \
			libgdbm-dev

install-tmux-plugin-manager:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-ansible:
	pip3 install ansible --user

install-docker:
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	sudo apt update -y -qq
	sudo apt install -y -qq docker-ce
	sudo usermod -aG docker $USER

install-docker-compose:
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

install-oh-my-zsh:
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > install-zsh.sh
	sh install-zsh.sh

install-nvim:
	mkdir ~/.config
	mkdir ~/.config/nvim/
	mkdir ~/.local/
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
	tar -xvf nvim-linux64.tar.gz
	mv nvim-linux64 ~/.local/nvim

copy-ubuntu-dotfiles:
	cp files/bashrc ~/.bashrc
	cp files/zshrc ~/.zshrc
	cp files/gitconfig ~/.gitconfig
	cp files/gitignore_global ~/.gitignore_global
	cp files/tmux.conf ~/.tmux.conf
	cp files/fzf.zsh ~/.fzf.zsh
	cp files/init.vim ~/.config/nvim/
	cp files/coc-settings.json ~/.config/nvim/

install-ripgrep:
	curl -lO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
	sudo dpkg -i ripgrep_11.0.2_amd64.deb

install-bat:
	wget https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb
	sudo dpkg -i bat_0.12.1_amd64.deb
