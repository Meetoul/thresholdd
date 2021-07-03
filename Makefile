PROGRAM := thresholdd
RUNIT_SV_DIR := $(shell ./install_tools/getsvdir.sh)
RUNIT_SERVICE_DIR := $(shell ./install_tools/getservicedir.sh)

ifeq ($(RUNIT_SV_DIR),)
$(error no runit sv dir found)
endif

ifeq ($(RUNIT_SERVICE_DIR),)
$(error no runit service dir found)
endif

all: $(PROGRAM)

install: $(PROGRAM)
	@echo "Installing to $(RUNIT_SV_DIR)"
	install -DZ $(PROGRAM) -t /usr/bin
	install -DZ run -t $(RUNIT_SV_DIR)/$(PROGRAM)

install_enable: install
	@echo "Enabling $(PROGRAM) service"
	ln -sf $(RUNIT_SV_DIR)/$(PROGRAM) $(RUNIT_SERVICE_DIR)

uninstall:
	rm -f /usr/bin/$(PROGRAM)
	rm -rf $(RUNIT_SV_DIR)/$(PROGRAM)
	rm -rf $(RUNIT_SERVICE_DIR)/$(PROGRAM)
