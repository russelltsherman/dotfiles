-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

current_dir = $(shell pwd)
DOTFILE_NAMES := $(subst ./dotfiles/, , $(shell find ./dotfiles -maxdepth 1 -name ".*"))
DOTFILES := $(addprefix ~/, $(DOTFILE_NAMES))

## initialize project
bootstrap:
	-make brew
	make dotfiles
.PHONY: bootstrap

cleandotfiles: # if there are existing symlinks for our dotfiles in ~/ remove them
	for file in $(DOTFILE_NAMES) ; do if [ -L ~/$$file ];then rm ~/$$file; fi; done
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
	make bootstrap
.PHONY: update

## load Visual Studio Code extensions
vscode:
	code --install-extension amazonwebservices.aws-toolkit-vscode
	code --install-extension bradymholt.pgformatter
	code --install-extension budparr.language-hugo-vscode
	code --install-extension bungcip.better-toml
	code --install-extension coolbear.systemd-unit-file
	code --install-extension cssho.vscode-svgviewer
	code --install-extension DavidAnson.vscode-markdownlint
	code --install-extension DavidWang.ini-for-vscode
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension dunstontc.viml
	code --install-extension eamodio.gitlens
	code --install-extension EditorConfig.EditorConfig
	code --install-extension esbenp.prettier-vscode
	code --install-extension formulahendry.auto-close-tag
	code --install-extension ginfuru.ginfuru-better-solarized-dark-theme
	code --install-extension HookyQR.beautify
	code --install-extension huizhou.githd
	code --install-extension idleberg.applescript
	code --install-extension JPTarquino.postgresql
	code --install-extension marcostazi.vs-code-vagrantfile
	code --install-extension mark-tucker.aws-cli-configure
	code --install-extension mauve.terraform
	code --install-extension ms-azuretools.vscode-docker
	code --install-extension ms-python.python
	code --install-extension ms-vscode.cpptools
	code --install-extension ms-vscode.Go
	code --install-extension msjsdiag.debugger-for-chrome
	code --install-extension PKief.material-icon-theme
	code --install-extension redhat.vscode-yaml
	code --install-extension timonwong.shellcheck
	code --install-extension tomoki1207.pdf
	code --install-extension tomphilbin.gruvbox-themes
	# code --install-extension vscodevim.vim
	code --install-extension vscoss.vscode-ansible
	code --install-extension WakaTime.vscode-wakatime
	code --install-extension wholroyd.jinja
	code --install-extension xaver.clang-format
	code --install-extension zxh404.vscode-proto3

	mkdir -p ~/Library/Application\ Support/Code/User/
	ln -sv ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
.PHONY: vscode

/etc/hosts:
	sudo wget -O /etc/hosts https://someonewhocares.org/hosts/hosts

~/.%: # create symlink form ~/.dotfile and ./dotfiles/.dotfile
	cd ~ && ln -sv $(current_dir)/dotfiles/$(notdir $@) $@
