setup-ubuntu: install-apt-packages \
	install-oh-my-zsh \
	install-tmux-plugin-manager \
	copy-ubuntu-dotfiles \
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
			python3 \
			python3-pip \
			tmux

install-tmux-plugin-manager:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

copy-ubuntu-dotfiles:
	cp bashrc ~/.bashrc
	cp zshrc.ubuntu ~/.zshrc
	cp bash_profile ~/.bash_profile
	cp gitconfig ~/.gitconfig
	cp gitignore_global ~/.gitignore_global
	cp tmux.conf.ubuntu ~/.tmux.conf
	echo 'alias pip=pip3' >> ~/.zshrc
	echo 'alias python=python3' >> ~/.zshrc

install-ansible:
	pip install ansible --user

install-docker:
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	apt-get update -y -qq
	apt-get install -y -qq docker-ce

install-docker-compose:
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

install-oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
