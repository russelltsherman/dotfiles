-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/russelltsherman/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

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

sudo/noprompt:
	echo "$(shell whoami) ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$(shell whoami)
.PHONY: sudo/noprompt

sudo/prompt:
	sudo rm -rf /etc/sudoers.d/$(shell whoami)
.PHONY: sudo/prompt

## pull upstream changes
update: refresh-build-harness
	git pull
	-rvm get stable
	make bootstrap
.PHONY: update

vim:
	curl https://raw.githubusercontent.com/russelltsherman/vim/master/bin/bootstrap | bash
.PHONY: vim

vscode:
	curl https://raw.githubusercontent.com/russelltsherman/vscode/master/bin/bootstrap | bash
.PHONY: vscode

zsh:
	curl https://raw.githubusercontent.com/russelltsherman/zsh/master/bin/bootstrap | bash
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
