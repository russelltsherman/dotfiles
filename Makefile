-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

## initialize project
bootstrap: 
	-make brew
.PHONY: bootstrap

## pull upstream changes
update: refresh-build-harness
	git pull
	make bootstrap
.PHONY: update

/etc/hosts:
	sudo wget -O /etc/hosts https://someonewhocares.org/hosts/hosts
