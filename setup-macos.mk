install-brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-brew-packages:
	brew bundle --file macos/Brewfile

set-settings:
	sh macos/settings.sh
