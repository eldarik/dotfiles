install-brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-brew-packages:
	brew tap homebrew/cask-fonts
	brew install \
		adns \
		aom \
		aria2 \
		autoconf \
		automake \
		bat \
		bdw-gc \
		c-ares \
		cairo \
		cmake \
		coreutils \
		ctags \
		dav1d \
		docbook \
		docbook-xsl \
		exa \
		fd \
		ffmpeg \
		flac \
		fontconfig \
		freetype \
		frei0r \
		fribidi \
		gdbm \
		gettext \
		gh \
		ghostscript \
		giflib \
		git \
		glib \
		gmp \
		gnu-getopt \
		gnupg \
		gnutls \
		gobject-introspection \
		graphite2 \
		guile \
		harfbuzz \
		htop \
		icu4c \
		ilmbase \
		imagemagick \
		imath \
		jbig2dec \
		jemalloc \
		jpeg \
		jq \
		krb5 \
		lame \
		leptonica \
		libass \
		libassuan \
		libbluray \
		libde265 \
		libev \
		libevent \
		libffi \
		libgcrypt \
		libgpg-error \
		libheif \
		libidn \
		libidn2 \
		libksba \
		liblqr \
		libogg \
		libomp \
		libpng \
		libpthread-stubs \
		libsamplerate \
		libsndfile \
		libsodium \
		libsoxr \
		libssh2 \
		libtasn1 \
		libtermkey \
		libtiff \
		libtool \
		libunistring \
		libusb \
		libuv \
		libvidstab \
		libvorbis \
		libvpx \
		libvterm \
		libx11 \
		libxau \
		libxcb \
		libxdmcp \
		libxext \
		libxrender \
		libyaml \
		little-cms2 \
		lua \
		luajit \
		luajit-openresty \
		luv \
		lz4 \
		lzo \
		m4 \
		make \
		mosh \
		mpdecimal \
		msgpack \
		ncurses \
		neofetch \
		nettle \
		nghttp2 \
		npth \
		oniguruma \
		opencore-amr \
		openexr \
		openjpeg \
		openssl@1.1 \
		opus \
		p11-kit \
		p7zip \
		pcre \
		pcre2 \
		perl \
		pinentry \
		pixman \
		pkg-config \
		popt \
		postgresql \
		rav1e \
		readline \
		redis \
		ripgrep \
		rsync \
		rtmpdump \
		rubberband \
		ruby-build \
		s3cmd \
		sdl2 \
		six \
		snappy \
		speedtest-cli \
		speex \
		sqlite \
		srt \
		tcl-tk \
		tesseract \
		theora \
		tig \
		tmux \
		unbound \
		unibilium \
		utf8proc \
		v8 \
		vim \
		webp \
		wget \
		x264 \
		x265 \
		xmlto \
		xorgproto \
		xvid \
		xxhash \
		xz \
		you-get \
		youtube-dl \
		zeromq \
		zimg \
		zsh \
		zstd \
		docker \
		font-anonymous-pro \
		ngrok
	brew tap heroku/brew
	brew install heroku

install-apps-via-brew:
	brew install \
		1password \
		alfred \
		anydesk \
		authy \
		discord \
		dropbox \
		firefox \
		homebrew/cask-versions/firefox-developer-edition \
		gimp \
		google-chrome \
		google-chrome-dev \
		iina \
		iterm2 \
		karabiner-elements \
		slack \
		telegram \
		notion \
		spotify \
		soda-player \
		tunnelblick

install-nvim-macos:
	- mkdir ~/.local/
	- curl -o ~/.local/nvim.tar.gz -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
	- tar xzf ~/.local/nvim.tar.gz -C ~/.local/
	- rm ~/.local/nvim.tar.gz
	- mv ~/.local/nvim-osx64 ~/.local/nvim
