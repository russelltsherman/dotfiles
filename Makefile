-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/main/templates/Makefile.build-harness"; echo .build-harness)

current_dir = $(shell pwd)
BINSCRIPT_NAMES := $(subst ./, , $(shell find ./bin -maxdepth 1 -type f \( ! -iname "bootstrap" \)))
BINSCRIPTS := $(addprefix ~/, $(BINSCRIPT_NAMES))
DOTFILE_NAMES := $(subst ./dotfiles/, , $(shell find ./dotfiles -maxdepth 1 -name ".*"))
DOTFILES := $(addprefix ~/, $(DOTFILE_NAMES))

## initialize project
bootstrap: init
	-make brew
	make binscripts
	make dotfiles
	make gitconfig
	make terraform
	make vim
	make tmux
	make vscode
	make zsh
	pip install -r requirements.txt
	~/.rvm/scripts/rvm
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

sudo/noprompt:
	echo "$(shell whoami) ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$(shell whoami)
.PHONY: sudo/noprompt

sudo/prompt:
	sudo rm -rf /etc/sudoers.d/$(shell whoami)
.PHONY: sudo/prompt

## install terraform and terragrunt
terraform:
	# Install tfenv
	-git clone https://github.com/tfutils/tfenv.git ~/.tfenv
	-ln -s ~/.tfenv/bin/* /usr/local/bin # Add tfenv to your path
	# install terraform versions
	tfenv install 0.12.29
	tfenv use 0.12.29
	# Install tgenv
	-git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv
	-ln -s ~/.tgenv/bin/* /usr/local/bin # Add tgenv to your path
	# Install tgenv versions
	tgenv install 0.23.40
	tgenv use 0.23.40
.PHONY: terraform

## pull upstream changes
update: refresh-build-harness
	git pull
	-rvm get stable
	make bootstrap
.PHONY: update

tmux:
	curl https://raw.githubusercontent.com/russelltsherman/tmux/main/bin/bootstrap | bash
.PHONY: tmux

vim:
	curl https://raw.githubusercontent.com/russelltsherman/vim/main/bin/bootstrap | bash
.PHONY: vim

vscode:
	curl https://raw.githubusercontent.com/russelltsherman/vscode/main/bin/bootstrap | bash
.PHONY: vscode

zsh:
	curl https://raw.githubusercontent.com/russelltsherman/zsh/main/bin/bootstrap | bash
.PHONY: zsh

/etc/hosts:
	sudo wget -O /etc/hosts https://someonewhocares.org/hosts/hosts
.PHONY: /etc/hosts

~/.%: # create symlink form ~/.dotfile and ./dotfiles/.dotfile
	cd ~ && ln -sv $(current_dir)/dotfiles/$(notdir $@) $@

~/bin/%: # create symlink form ~/bin/binscript and ./bin/binscript
	cd ~ && ln -sv $(current_dir)/bin/$(notdir $@) $@

~/.rvm/scripts/rvm:
	gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	\curl -sSL https://get.rvm.io | bash -s stable --rails
	sudo usermod -a -G rvm $$(whoami)
