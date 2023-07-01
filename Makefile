PROFILE := $(HOME)/.bash_profile
BASHRC := $(HOME)/.bashrc
VIMRC := $(HOME)/.vimrc
LOCAL_DIR := $(HOME)/.local
VIM_DIR := $(HOME)/.vim

SOURCE_BASH_PROFILE := bash_profile
SOURCE_BASHRC := bashrc
SOURCE_VIMRC := vimrc
SOURCE_LOCAL_DIR := local
SOURCE_VIM_DIR := vim

BACKUP_DIR := $(HOME)/.profile_backup
BACKUP_LOCAL_DIR := $(BACKUP_DIR)/.local
BACKUP_VIM_DIR := $(BACKUP_DIR)/.vim

.PHONY: install uninstall

install:
	@mkdir -p $(HOME)/.local
	@mkdir -p $(HOME)/.vim
	@mkdir -p $(BACKUP_DIR)

	@$(if $(wildcard $(LOCAL_DIR)), mkdir -p $(BACKUP_LOCAL_DIR))
	@$(if $(wildcard $(VIM_DIR)), mkdir -p $(BACKUP_VIM_DIR))

	@$(if $(wildcard $(PROFILE)), cp $(PROFILE) $(BACKUP_DIR))
	@$(if $(wildcard $(BASHRC)), cp $(BASHRC) $(BACKUP_DIR))
	@$(if $(wildcard $(VIMRC)), cp $(VIMRC) $(BACKUP_DIR))
	@$(if $(wildcard $(LOCAL_DIR)), cp -r $(LOCAL_DIR)/* $(BACKUP_LOCAL_DIR))
	@$(if $(wildcard $(VIM_DIR)), cp -r $(VIM_DIR)/* $(BACKUP_VIM_DIR))

	@cp $(SOURCE_BASH_PROFILE) $(PROFILE)
	@cp $(SOURCE_BASHRC) $(BASHRC)
	@cp $(SOURCE_VIMRC) $(VIMRC)
	@cp -r $(SOURCE_LOCAL_DIR)/* $(LOCAL_DIR)
	@cp -r $(SOURCE_VIM_DIR)/* $(VIM_DIR)

uninstall:
	@rm $(PROFILE)
	@rm $(BASHRC)
	@rm $(VIMRC)
	@rm -rf $(LOCAL_DIR)
	@rm -rf $(VIM_DIR)

	@$(if $(wildcard $(BACKUP_DIR)/.bash_profile), mv $(BACKUP_DIR)/.bash_profile $(HOME))
	@$(if $(wildcard $(BACKUP_DIR)/.bashrc), mv $(BACKUP_DIR)/.bashrc $(HOME))
	@$(if $(wildcard $(BACKUP_DIR)/.vimrc), mv $(BACKUP_DIR)/.vimrc $(HOME))
	@$(if $(wildcard $(BACKUP_LOCAL_DIR)), mv $(BACKUP_LOCAL_DIR) $(HOME))
	@$(if $(wildcard $(BACKUP_VIM_DIR)), mv $(BACKUP_VIM_DIR) $(HOME))

	@$(if $(wildcard $(BACKUP_DIR)), rm -rf $(BACKUP_DIR))
