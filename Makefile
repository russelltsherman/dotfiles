-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

## install project requirements
bootstrap: 
.PHONY: bootstrap

## pull upstream changes
update: refresh-build-harness
	git pull
	make bootstrap
.PHONY: update

