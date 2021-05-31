install-brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-brew-packages:
	brew install \
		adns \
		aria2 \
		autoconf \
		automake \
		bat \
		cmake \
		coreutils \
		docbook \
		docbook-xsl \
		freetype \
		gdbm \
		gettext \
		ghostscript \
		git \
		glib \
		gmp \
		gnu-getopt \
		gnupg \
		gnutls \
		htop \
		icu4c \
		ilmbase \
		imagemagick \
		jemalloc \
		jpeg \
		jq \
		krb5 \
		libassuan \
		libde265 \
		libevent \
		libffi \
		libgcrypt \
		libgpg-error \
		libheif \
		libidn2 \
		libksba \
		libomp \
		libpng \
		libssh2 \
		libtasn1 \
		libtermkey \
		libtiff \
		libtool \
		libunistring \
		libusb \
		libuv \
		libvterm \
		libyaml \
		little-cms2 \
		lua \
		luajit \
		m-cli \
		make \
		mosh \
		msgpack \
		mysql \
		mysql-client \
		ncurses \
		nettle \
		npth \
		oniguruma \
		openexr \
		openjpeg \
		openssl@1.1 \
		p11-kit \
		p7zip \
		pcre \
		pcre2 \
		perl \
		pinentry \
		pkg-config \
		postgresql \
		protobuf \
		python@3.8 \
		readline \
		redis \
		ripgrep \
		rtmpdump \
		ruby \
		shared-mime-info \
		speedtest-cli \
		sqlite \
		tmux \
		unbound \
		unibilium \
		utf8proc \
		v8 \
		vim \
		webp \
		wget \
		x265 \
		xmlto \
		xz \
		you-get \
		youtube-dl \
		zsh

install-brew-casks:
	brew tap homebrew/cask-fonts
	brew cask install \
		alacritty \
		anydesk \
		alfred \
		chromedriver \
		discord \
		dropbox \
		firefox \
		font-anonymous-pro \
		gimp \
		google-backup-and-sync \
		google-chrome \
		gswitch \
		iina \
		iterm2 \
		karabiner-elements \
		macmediakeyforwarder \
		mtmr \
		ngrok \
		puush \
		sensei \
		skype \
		slack \
		soda-player \
		spotify \
		steam \
		sublime-text \
		telegram \
		toggl-track \
		tunnelblick \
		turbo-boost-switcher

install-nvim-macos:
	- mkdir ~/.local/
	- curl -o ~/.local/nvim.tar.gz -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
	- tar xzf ~/.local/nvim.tar.gz -C ~/.local/
	- rm ~/.local/nvim.tar.gz
	- mv ~/.local/nvim-osx64 ~/.local/nvim

copy-karabiner-config:
	- mkdir ~/.config/karabiner/
	cp files/karabiner.json ~/.config/karabiner/
