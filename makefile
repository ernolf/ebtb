# Makefile for compilation, editing, and installation of Bash scripts and modules

# Bindir for scripts
BINDIR := $(shell . config/configure && echo $$BINDIR)
# Include directory for modules
INCLUDEDIR := $(shell . config/configure && echo $$INCLUDEDIR)
# Directory for scripts
SCRIPTS_DIR := $(shell . config/configure && echo $$SCRIPTS_DIR)
# Directory for modules
MODULES_DIR := $(shell . config/configure && echo $$MODULES_DIR)
# Directory for tools
TOOLS_DIR := $(shell . config/configure && echo $$TOOLS_DIR)
# Directory for the build process
BUILD_DIR := $(shell . config/configure && echo $$BUILD_DIR)
# Directory for the script build process
SBUILD_DIR := $(shell . config/configure && echo $$SBUILD_DIR)
# Directory for the module build process
MBUILD_DIR := $(shell . config/configure && echo $$MBUILD_DIR)

# Default goal
.DEFAULT_GOAL := help

# List of scripts
SCRIPTS_BASE = $(notdir $(basename $(wildcard $(SCRIPTS_DIR)/*)))

# List of modules
MODULES_REL = $(shell find $(MODULES_DIR) -type f | sed 's|$(MODULES_DIR)/||')
MODULES = $(patsubst %,$(MBUILD_DIR)/%,$(MODULES_REL))

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
$(SBUILD_DIR)/%: $(SCRIPTS_DIR)/% | set-executable
	mkdir -p $(SBUILD_DIR)
	$(TOOLS_DIR)/build_script $< $@

$(SCRIPTS_BASE): % : $(SBUILD_DIR)/%

# Build all scripts without test format with 'make all-prod'
.PHONY: all-prod
all-prod: set-executable $(SCRIPTS_BASE:%=$(SBUILD_DIR)/%)

$(SBUILD_DIR)/%: $(SCRIPTS_DIR)/%
	mkdir -p $(SBUILD_DIR)
	$(TOOLS_DIR)/build_script $< $@

# Build a test script with 'make test SCRIPT_NAME=<script_name>'
.PHONY: test
test: set-executable
	mkdir -p $(SBUILD_DIR)
	$(TOOLS_DIR)/build_script $(SCRIPTS_DIR)/$(SCRIPT_NAME) $(SBUILD_DIR)/$(SCRIPT_NAME)-test test

# Build all test scripts with 'make all-test'
.PHONY: all-test
all-test: set-executable $(SCRIPTS_BASE:%=$(SBUILD_DIR)/%-test)

$(SBUILD_DIR)/%-test: $(SCRIPTS_DIR)/%
	mkdir -p $(SBUILD_DIR)
	$(TOOLS_DIR)/build_script $< $@ test

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
	$(TOOLS_DIR)/sign_script $^

# Build a module
$(MBUILD_DIR)/%: $(MODULES_DIR)/% | set-executable
	mkdir -p $(dir $@)
	$(TOOLS_DIR)/build_module $< $@

# Build a module with 'make $modulename'
$(MODULES_REL): % : $(MBUILD_DIR)/%

# Build all modules with 'make modules'
.PHONY: modules
modules: $(MODULES) set-executable

# Build a specific module with 'make module MODULE_NAME=<module_name>'
.PHONY: module
module: set-executable
	mkdir -p $(dir $(MBUILD_DIR)/$(MODULE_NAME))
	$(TOOLS_DIR)/build_module $(MODULES_DIR)/$(MODULE_NAME) $(MBUILD_DIR)/$(MODULE_NAME)

# Install built modules to INCLUDEDIR/test
.PHONY: install-modules
install-modules: $(MODULES)
	@echo "Installing modules to $(INCLUDEDIR)/test..."
	mkdir -p $(INCLUDEDIR)/test
	cp -r $(MBUILD_DIR)/* $(INCLUDEDIR)/test
	@echo "Done."

# Sign 'prod' modules and upload to webserver
.PHONY: sign-and-release-modules
sign-and-release-modules: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading 'prod' modules to moduleserver..."
	$(TOOLS_DIR)/sign_module -t2p

# Sign 'test' modules and upload to webserver
.PHONY: sign-and-release-test-modules
sign-and-release-test-modules: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading 'test' modules to moduleserver..."
	$(TOOLS_DIR)/sign_module -t2t

# Sign 'prod' modules and upload to webserver
.PHONY: sign-and-release-all-modules
sign-and-release-all-modules: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading 'prod' modules to moduleserver..."
	$(TOOLS_DIR)/sign_module -p -a -y

# Sign 'test' modules and upload to webserver
.PHONY: sign-and-release-all-test-modules
sign-and-release-all-test-modules: $(wildcard $(SBUILD_DIR)/*)
	@echo "Signing and uploading 'test' modules to moduleserver..."
	$(TOOLS_DIR)/sign_module -t -a -y

# Clean build directory
.PHONY: clean
clean:
	@echo "Cleaning up..."
	rm -rf $(BUILD_DIR)
	@echo "Done."

