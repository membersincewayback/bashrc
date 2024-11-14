USER_HOME := $(shell test -n "$(SUDO_USER)" && eval echo ~$(SUDO_USER) || echo $(HOME))

PROFILE := $(USER_HOME)/.bash_profile
BASHRC := $(USER_HOME)/.bashrc
VIMRC := $(USER_HOME)/.vimrc
LOCAL_DIR := $(USER_HOME)/.local
VIM_DIR := $(USER_HOME)/.vim

SOURCE_BASH_PROFILE := bash_profile
SOURCE_BASHRC := bashrc
SOURCE_VIMRC := vimrc
SOURCE_LOCAL_DIR := local
SOURCE_VIM_DIR := vim

BACKUP_DIR := $(USER_HOME)/.profile_backup

.PHONY: install uninstall

install:
	@mkdir -p $(BACKUP_DIR)
	@mkdir -p $(LOCAL_DIR)
	@mkdir -p $(VIM_DIR)

	@$(if $(wildcard $(PROFILE)), cp $(PROFILE) $(BACKUP_DIR))
	@$(if $(wildcard $(BASHRC)), cp $(BASHRC) $(BACKUP_DIR))
	@$(if $(wildcard $(VIMRC)), cp $(VIMRC) $(BACKUP_DIR))
	@$(if $(wildcard $(LOCAL_DIR)), cp -r $(LOCAL_DIR) $(BACKUP_DIR))
	@$(if $(wildcard $(VIM_DIR)), cp -r $(VIM_DIR) $(BACKUP_DIR))

	@cp $(SOURCE_BASH_PROFILE) $(PROFILE)
	@cp $(SOURCE_BASHRC) $(BASHRC)
	@cp $(SOURCE_VIMRC) $(VIMRC)
	@cp -r $(SOURCE_LOCAL_DIR)/* $(LOCAL_DIR)
	@cp -r $(SOURCE_VIM_DIR)/* $(VIM_DIR)

	@test -n $(SUDO_USER) && { \
		chown -R $(SUDO_USER): $(BACKUP_DIR); \
		chown -R $(SUDO_USER): $(USER_HOME)/.vim; \
		chown -R $(SUDO_USER): $(USER_HOME)/.local; \
		chown $(SUDO_USER): $(USER_HOME)/.vimrc; \
		chown $(SUDO_USER): $(USER_HOME)/.bashrc; \
		chown $(SUDO_USER): $(USER_HOME)/.bash_profile; \
	}

uninstall:
	@$(if $(wildcard $(PROFILE)), rm $(PROFILE))
	@$(if $(wildcard $(BASHRC)), rm $(BASHRC))
	@$(if $(wildcard $(VIMRC)), rm $(VIMRC))
	@$(if $(wildcard $(LOCAL_DIR)), rm -rf $(LOCAL_DIR))
	@$(if $(wildcard $(VIM_DIR)), rm -rf $(VIM_DIR))

	@$(if $(wildcard $(BACKUP_DIR)/.bash_profile), mv $(BACKUP_DIR)/.bash_profile $(HOME))
	@$(if $(wildcard $(BACKUP_DIR)/.bashrc), mv $(BACKUP_DIR)/.bashrc $(HOME))
	@$(if $(wildcard $(BACKUP_DIR)/.vimrc), mv $(BACKUP_DIR)/.vimrc $(HOME))
	@$(if $(wildcard $(BACKUP_LOCAL_DIR)), mv $(BACKUP_LOCAL_DIR) $(HOME))
	@$(if $(wildcard $(BACKUP_VIM_DIR)), mv $(BACKUP_VIM_DIR) $(HOME))

	@$(if $(wildcard $(BACKUP_DIR)), rm -rf $(BACKUP_DIR))
