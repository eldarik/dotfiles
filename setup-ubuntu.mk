install-apt-packages:
	sudo apt update -y -qq && \
		sudo apt upgrade -y -qq && \
		sudo apt install -y -qq \
			make \
			git \
			wget \
			fzf \
			mosh \
			python3 \
			python3-pip \
			python3-setuptools \
			tmux \
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
			ripgrep \
			fish

install-docker-compose:
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

install-ubuntu-nvim:
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
	sudo dpkg -i nvim-linux64.deb

install-bat:
	wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
	sudo dpkg -i bat_0.12.1_amd64.deb

set-fish:
	chsh -s $(which fish)
