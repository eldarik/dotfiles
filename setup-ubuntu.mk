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
			libgdbm-dev \
			automake \
			libxml2-dev \
			libcurl4-openssl-dev \
			libsqlite3-dev \
			libpq-dev \
			jq \
			pkg-config \
			ripgrep

install-docker:
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	sudo apt update -y -qq
	sudo apt install -y -qq docker-ce
	sudo usermod -aG docker eldar

install-docker-compose:
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

install-ubuntu-nvim:
	- mkdir ~/.config
	- mkdir ~/.config/nvim/
	- mkdir ~/.local/
	- wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
	- tar -xvf nvim-linux64.tar.gz
	- mv nvim-linux64 ~/.local/nvim
	- mv nvim-linux64 ~/.local/nvim

install-bat:
	wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
	sudo dpkg -i bat_0.12.1_amd64.deb
