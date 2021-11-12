install-brew:
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-brew-packages:
	brew bundle --file macos/Brewfile

macos-set-settings:
	sh macos/settings.sh
