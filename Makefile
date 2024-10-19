ifeq ($(XDG_CONFIG_DIR),)
	CONF_DIR=$(HOME)/.config/fish
else
	CONF_DIR=$(XDG_CONFIG_DIR)/fish
endif
install:
	stow -S . -t $(CONF_DIR)
uninstall:
	stow -D . -t $(CONF_DIR)
