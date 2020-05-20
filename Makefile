include install-asdf.mk
include setup-macos.mk
include setup-ubuntu.mk
include setup-vpn.mk

install-oh-my-zsh:
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > install-zsh.sh
	sh install-zsh.sh
