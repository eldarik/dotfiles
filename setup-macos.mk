install-brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-brew-packages:
	brew install autoconf \
		mosh \
		aria2c \
		automake \
		coreutils \
		gdbm \
		gettext \
		git \
		gmp \
		gnupg \
		gnutls \
		icu4c \
		jemalloc \
		libassuan \
		libevent \
		libffi \
		libgcrypt \
		libgpg-error \
		libidn2 \
		libksba \
		libtasn1 \
		libtermkey \
		libtool \
		libunistring \
		libusb \
		libuv \
		libvterm \
		libyaml \
		luajit \
		m-cli \
		msgpack \
		nettle \
		npth \
		openssl \
		openssl@1.1 \
		p11-kit \
		p7zip \
		pcre \
		perl \
		pinentry \
		pkg-config \
		postgresql \
		readline \
		sqlite \
		tmux \
		unibilium \
		v8 \
		vim \
		wget \
		xz \
		you-get \
		zsh \
		bat \
		ripgrep \
		youtube-dl

	brew tap homebrew/cask-fonts
	brew cask install font-anonymous-pro \
		chromedriver \
		ngrok \
		gswitch
# TODO add install nvim
# TODO add install ansible
