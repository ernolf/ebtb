# Makefile for compilation, editing, and installation of Bash scripts and modules

# Bindir for scripts
BINDIR := $(shell . config/configure && echo $$BINDIR)
# Include directory for modules
MODULES_DIR := $(shell . config/configure && echo $$MODULES_DIR)
# Directory for scripts
SCRIPTS := $(shell . config/configure && echo $$SCRIPTS)
# Directory for modules
MODULES := $(shell . config/configure && echo $$MODULES)
# Directory for tools
TOOLS := $(shell . config/configure && echo $$TOOLS)
# Directory for the build process
BUILD := $(shell . config/configure && echo $$BUILD)
# Directory for the script build process
SBUILD_DIR := $(shell . config/configure && echo $$SBUILD_DIR)
# Directory for the module build process
MBUILD_DIR := $(shell . config/configure && echo $$MBUILD_DIR)

# Default goal
.DEFAULT_GOAL := help

# List of scripts
SCRIPTS_BASE = $(notdir $(basename $(wildcard $(SCRIPTS)/*)))

# List of modules
MODULES_REL = $(shell find $(MODULES) -type f | sed 's|$(MODULES)/||')
MODULES_ = $(patsubst %,$(MBUILD_DIR)/%,$(MODULES_REL))

# Help message
help:
	@echo "Usage:"
	@echo "  make <script_name>                    - Build 'prod' script"
	@echo "  make test SCRIPT_NAME=<script_name>   - Build 'test' script"
	@echo "  make all-prod                         - Build all 'prod' scripts"
	@echo "  make all-test                         - Build all 'test' scripts"
	@echo "  make and-install-all-scripts          - Build and install all (prod) scripts"
	@echo "  make install-builts                   - Install only the scripts built in the build directory"
	@echo "  make uninstall                        - Uninstall scripts"
	@echo "  make sign-and-release-scripts         - Sign and upload scripts to the webserver"
	@echo "  make <module_name>                    - Build specific module"
	@echo "  make module MODULE_NAME=<module_name> - Build specific module (very stable version)"
	@echo "  make modules                          - Build all modules"
	@echo "  make install-modules                  - Install built modules (only test channel)"
	@echo "  make sign-and-release-modules         - Sign and upload 'prod' modules to webserver (only if different)"
	@echo "  make sign-and-release-test-modules    - Sign and upload 'test' modules to webserver (only if different)"
	@echo "  make sign-and-release-all-modules     - Sign and upload 'prod' modules to webserver"
	@echo "  make sign-and-release-all-test-modules- Sign and upload 'test' modules to webserver"
	@echo "  make clean                            - Clean build directory"

# Set the executable bit for all files in the tools/ directory
.PHONY: set-executable
set-executable:
	@echo "Setting executable flag for files in tools/ directory..."
	chmod +x tools/*
	@echo "Done."

# Build a normal script
$(SBUILD_DIR)/%: $(SCRIPTS)/% | set-executable
	mkdir -p $(SBUILD_DIR)
	$(TOOLS)/build_script $< $@

$(SCRIPTS_BASE): % : $(SBUILD_DIR)/%

# Build all scripts without test format with 'make all-prod'
.PHONY: all-prod
all-prod: set-executable $(SCRIPTS_BASE:%=$(SBUILD_DIR)/%)

$(SBUILD_DIR)/%: $(SCRIPTS)/%
	mkdir -p $(SBUILD_DIR)
	$(TOOLS)/build_script $< $@

# Build a test script with 'make test SCRIPT_NAME=<script_name>'
.PHONY: test
test: set-executable
	mkdir -p $(SBUILD_DIR)
	$(TOOLS)/build_script $(SCRIPTS)/$(SCRIPT_NAME) $(SBUILD_DIR)/$(SCRIPT_NAME)-test test

# Build all test scripts with 'make all-test'
.PHONY: all-test
all-test: set-executable $(SCRIPTS_BASE:%=$(SBUILD_DIR)/%-test)

$(SBUILD_DIR)/%-test: $(SCRIPTS)/%
	mkdir -p $(SBUILD_DIR)
	$(TOOLS)/build_script $< $@ test

# Make and install all scripts (not test)
.PHONY: and-install-all-scripts
and-install-all-scripts: $(addprefix $(SBUILD_DIR)/,$(SCRIPTS_BASE))
	mkdir -p $(BINDIR)
	cp $^ $(BINDIR)
	chmod +x $(addprefix $(BINDIR)/,$(notdir $^))

# Install only the scripts built in the build directory
.PHONY: install-builts
install-builts: $(wildcard $(SBUILD_DIR)/*)
	mkdir -p $(BINDIR)
	cp $^ $(BINDIR)
	chmod +x $(addprefix $(BINDIR)/,$(notdir $^))

# Uninstall scripts
.PHONY: uninstall
uninstall:
	rm -f $(addprefix $(BINDIR)/,$(SCRIPTS_BASE))
	rm -f $(addprefix $(BINDIR)/,$(addsuffix -test,$(SCRIPTS_BASE)))

# Sign scripts and upload to webserver
.PHONY: sign-and-release-scripts
sign-and-release-scripts: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading scripts to nextcloud webserver..."
	$(TOOLS)/sign_script $^

# Build a module
$(MBUILD_DIR)/%: $(MODULES)/% | set-executable
	mkdir -p $(dir $@)
	$(TOOLS)/build_module $< $@

# Build a module with 'make $modulename'
$(MODULES_REL): % : $(MBUILD_DIR)/%

# Build all modules with 'make modules'
.PHONY: modules
modules: $(MODULES_) set-executable

# Build a specific module with 'make module MODULE_NAME=<module_name>'
.PHONY: module
module: set-executable
	mkdir -p $(dir $(MBUILD_DIR)/$(MODULE_NAME))
	$(TOOLS)/build_module $(MODULES)/$(MODULE_NAME) $(MBUILD_DIR)/$(MODULE_NAME)

# Install built modules to MODULES_DIR/test
.PHONY: install-modules
install-modules: $(MODULES_)
	@echo "Installing modules to $(MODULES_DIR)/test..."
	mkdir -p $(MODULES_DIR)/test
	cp -r $(MBUILD_DIR)/* $(MODULES_DIR)/test
	@echo "Done."

# Sign 'prod' modules and upload to webserver
.PHONY: sign-and-release-modules
sign-and-release-modules: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading 'prod' modules to moduleserver..."
	$(TOOLS)/sign_module -t2p

# Sign 'test' modules and upload to webserver
.PHONY: sign-and-release-test-modules
sign-and-release-test-modules: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading 'test' modules to moduleserver..."
	$(TOOLS)/sign_module -t2t

# Sign 'prod' modules and upload to webserver
.PHONY: sign-and-release-all-modules
sign-and-release-all-modules: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading 'prod' modules to moduleserver..."
	$(TOOLS)/sign_module -p -a -y

# Sign 'test' modules and upload to webserver
.PHONY: sign-and-release-all-test-modules
sign-and-release-all-test-modules: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading 'test' modules to moduleserver..."
	$(TOOLS)/sign_module -t -a -y

# Clean build directory
.PHONY: clean
clean:
	@echo "Cleaning up..."
	rm -rf $(BUILD)
	@echo "Done."

