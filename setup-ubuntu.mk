setup-linux-ubuntu: install-apt-packages \
	install-asdf \
	install-asdf-plugins \
	install-oh-my-zsh

install-apt-packages:
	apt update && apt upgrade
	apt install -y -qq
			make \
			git \
			gnugpg \
			wget \
			zsh \
			mosh

install-oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# TODO add install nvim

copy-dotfiles:
	cp bashrc ~/.bashrc && \
		cp zshrc ~/.zshrc && \
		cp bash_profile ~/.bash_profile && \
		cp profile ~/.profile && \
		cp gitconfig ~/.gitconfig && \
		cp gitignore_global ~/.gitignore_global && \
		cp tmux.conf ~/.tmux.conf
