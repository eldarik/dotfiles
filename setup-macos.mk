setup-macos: install-brew \
	install-brew-packages \
	install-asdf \
	install-asdf-plugins \
	install-oh-my-zsh \
	copy-dotfiles

install-brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-brew-packages:
	brew install ands \
			autoconf \
			automake \
			chromedriver \
			coreutils \
			gdbm \
			gettext \
			git \
			gmp \
			gnupg \
			gnutls \
			heroku \
			heroku-node \
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
			zsh

# TODO add install nvim
# TODO add install ansible

copy-dotfiles:
	cp bashrc ~/.bashrc && \
		cp zshrc ~/.zshrc && \
		cp inputrc ~/.inputrc && \
		cp bash_profile ~/.bash_profile && \
		cp gitconfig ~/.gitconfig && \
		cp gitignore_global ~/.gitignore_global && \
		cp tmux.conf.macos ~/.tmux.conf
