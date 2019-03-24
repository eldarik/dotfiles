setup-ubuntu: install-apt-packages \
	install-oh-my-zsh \
	copy-ubuntu-dotfiles \
	install-asdf \
	install-asdf-plugins

install-apt-packages:
	apt update -y -qq && \
		apt upgrade -y -qq && \
		apt install -y -qq \
			make \
			git \
			gnugpg \
			wget \
			zsh \
			mosh \
			tmux

install-oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# TODO add install nvim

copy-ubuntu-dotfiles:
	cp bashrc ~/.bashrc && \
		cp zshrc ~/.zshrc && \
		cp bash_profile ~/.bash_profile && \
		cp gitconfig ~/.gitconfig && \
		cp gitignore_global ~/.gitignore_global && \
		cp tmux.conf.ubuntu ~/.tmux.conf
