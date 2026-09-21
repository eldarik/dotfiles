install-mise:
	brew install mise

# Installs whatever the nearest .tool-versions / mise.toml pins. mise reads
# asdf's .tool-versions format natively, so project pins need no conversion.
install-mise-tools:
	mise install
