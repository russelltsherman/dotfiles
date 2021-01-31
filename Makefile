-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/main/templates/Makefile.build-harness"; echo .build-harness)

current_dir = $(shell pwd)
BINSCRIPT_NAMES := $(subst ./, , $(shell find ./bin -maxdepth 1 -type f \( ! -iname "bootstrap" \)))
BINSCRIPTS := $(addprefix ~/, $(BINSCRIPT_NAMES))
DOTFILE_NAMES := $(subst ./dotfiles/, , $(shell find ./dotfiles -maxdepth 1 -name ".*"))
DOTFILES := $(addprefix ~/, $(DOTFILE_NAMES))
LIBFILE_NAMES := $(subst ./lib/, , $(shell find ./lib -maxdepth 1 -name ".*"))
LIBFILES := $(addprefix ~/, $(LIBFILE_NAMES))

## initialize project
bootstrap:
	-make brew
	-make binscripts
	-make dotfiles
	-make libfiles
	-make gitconfig
	-make installs
	-make vim
	-make tmux
	-make vscode
	-make zsh
	-pip install -r requirements.txt
.PHONY: bootstrap

binscripts: cleanbinscripts \
	$(BINSCRIPTS) # iterate our list of dotfiles and ensure they are symlinked
.PHONY: binscripts

cleanbinscripts: # if there are existing symlinks for our dotfiles in ~/ remove them
	@for file in $(BINSCRIPT_NAMES) ; do if [ -L ~/$$file ];then rm ~/$$file; fi; done
.PHONY: cleanbinscripts

cleandotfiles: # if there are existing symlinks for our dotfiles in ~/ remove them
	@for file in $(DOTFILE_NAMES) ; do if [ -L ~/$$file ];then rm ~/$$file; fi; done
.PHONY: cleandotfiles

dotfiles: cleandotfiles \
	$(DOTFILES) # iterate our list of dotfiles and ensure they are symlinked
.PHONY: dotfiles

## include our supplemental global gitconfig into users global gitconfig
gitconfig:
	# link .gitignore to global git config
	git config --global core.excludesfile ./.gitignore
	# link .gitconfig_globbal to global git config
	git config --global include.path ./.gitconfig_global
.PHONY: gitconfig

## iterate install scripts in installs directory
installs:
	LC_COLLATE=C; for file in installs/*; do $${file}; done
.PHONY: installs

cleanlibfiles: # if there are existing symlinks for our dotfiles in ~/ remove them
	@for file in $(LIBFILE_NAMES) ; do if [ -L ~/$$file ];then rm ~/$$file; fi; done
.PHONY: cleanlibfiles

libfiles: cleanlibfiles \
	$(LIBFILES) # iterate our list of dotfiles and ensure they are symlinked
.PHONY: libfiles

sudo/noprompt:
	echo "$(shell whoami) ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$(shell whoami)
.PHONY: sudo/noprompt

sudo/prompt:
	[ "$(shell whoami)" != "vagrant" ] && sudo rm -rf /etc/sudoers.d/$(shell whoami)
.PHONY: sudo/prompt

## pull upstream changes
update: refresh-build-harness
	git pull
	make bootstrap
.PHONY: update

tmux:
	curl -fsSL https://raw.githubusercontent.com/russelltsherman/tmux/main/bin/bootstrap | bash
.PHONY: tmux

vim:
	curl -fsSL https://raw.githubusercontent.com/russelltsherman/vim/main/bin/bootstrap | bash
.PHONY: vim

vscode:
	curl -fsSL https://raw.githubusercontent.com/russelltsherman/vscode/main/bin/bootstrap | bash
.PHONY: vscode

zsh:
	curl -fsSL https://raw.githubusercontent.com/russelltsherman/zsh/main/bin/bootstrap | bash
.PHONY: zsh

/etc/hosts:
	sudo wget -O /etc/hosts https://someonewhocares.org/hosts/hosts
.PHONY: /etc/hosts

~/.%: # create symlink form ~/.dotfile and ./dotfiles/.dotfile
	cd ~ && ln -sv $(current_dir)/dotfiles/$(notdir $@) $@

~/bin/%: # create symlink form ~/bin/binscript and ./bin/binscript
	cd ~ && ln -sv $(current_dir)/bin/$(notdir $@) $@

~/lib/%: # create symlink form ~/lib/libfile and ./lib/libfile
	cd ~ && ln -sv $(current_dir)/lib/$(notdir $@) $@

