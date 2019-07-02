setup-ubuntu: install-apt-packages \
	install-tmux-plugin-manager \
	copy-ubuntu-dotfiles \
	install-ansible \
	install-docker \
	install-docker-compose \
	install-oh-my-zsh

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
			tmux

install-tmux-plugin-manager:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

copy-ubuntu-dotfiles:
	cp bashrc ~/.bashrc
	cp zshrc.ubuntu ~/.zshrc
	cp gitconfig ~/.gitconfig
	cp gitignore_global ~/.gitignore_global
	cp tmux.conf.ubuntu ~/.tmux.conf
	echo 'alias pip=pip3' >> ~/.zshrc
	echo 'alias python=python3' >> ~/.zshrc

install-ansible:
	pip3 install ansible --user

install-docker:
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt update -y -qq
	sudo apt install -y -qq docker-ce

install-docker-compose:
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

install-oh-my-zsh:
	sh -c `$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)`

install-nvim:
	mkdir ~/.config
	mkdir ~/.config/nvim/
	cp init.vim ~/.config/nvim/
	mkdir ~/.local/
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz > ~/.local/
	tar -xvf ~/.local/nvim-linux64.tar.gz
