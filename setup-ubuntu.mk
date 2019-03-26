setup-ubuntu: install-apt-packages \
	install-oh-my-zsh \
	copy-ubuntu-dotfiles \
	install-asdf \
	install-nvim-ubuntu \
	install-ansible \
	install-docker \
	install-docker-compose

install-apt-packages:
	apt update -y -qq && \
		apt upgrade -y -qq && \
		apt install -y -qq \
			make \
			git \
			wget \
			zsh \
			mosh \
			tmux

copy-ubuntu-dotfiles:
	cp bashrc ~/.bashrc && \
		cp zshrc ~/.zshrc && \
		cp bash_profile ~/.bash_profile && \
		cp gitconfig ~/.gitconfig && \
		cp gitignore_global ~/.gitignore_global && \
		cp tmux.conf.ubuntu ~/.tmux.conf && \
		echo 'alias pip=pip3' >> ~/.zshrc && \
		echo 'alias python=python3' >> ~/.zshrc

install-nvim-ubuntu:
	curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && \
		chmod u+x nvim.appimage && \
		mkdir ~/.local/ && \
		mkdir ~/.local/nvim/ && \
		mkdir ~/.local/nvim/bin/ && \
		mv nvim.appimage ~/.local/nvim/bin/nvim

configure-nvim-ubuntu:
		mkdir ~/.config/ && \
		mkdir ~/.config/nvim/ && \
		cp init.vim ~/.config/nvim/ && \
		 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

install-ansible:
	pip install ansible


install-docker:
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
		add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
		apt-get update -y -qq && \
		apt-get install -y -qq docker-ce

install-docker-compose:
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
		sudo chmod +x /usr/local/bin/docker-compose
