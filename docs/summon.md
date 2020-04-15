# SUMMON

[summon](https://cyberark.github.io/summon/) is a command-line tool that reads a file in secrets.yml format and injects secrets as environment variables into any process. Once the process exits, the secrets are gone.

```txt
[I] ➜ summon -h
NAME:
   summon - Parse secrets.yml and export environment variables

USAGE:
   summon [global options] command [command options] [arguments...]

VERSION:
   0.8.1

COMMANDS:
     help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   -p value, --provider value     Path to provider for fetching secrets
   -e value, --environment value  Specify section/environment to parse from secrets.yaml
   -f value                       Path to secrets.yml (default: "secrets.yml")
   -D value                       var=value causes substitution of value to $var
   --yaml value                   secrets.yml as a literal string
   --ignore value, -i value       Ignore the specified key if is isn't accessible or doesn't exist
   --ignore-all, -I               Ignore inaccessible or missing keys
   --help, -h                     show help
   --version, -v                  print the version
```

[I] ➜ summon -p /usr/local/bin/gopass -f secrets.yml bash -c 'env | grep APP'

symlink gopass to /usr/local/lib/summon/gopass
[I] ➜ mkdir -p /usr/local/lib/summon/
[I] ➜ ln -s /usr/local/bin/gopass /usr/local/lib/summon/gopass

this allows shortening the provider flag to the summon command
[I] ➜ summon -p gopass -f secrets.yml bash -c 'env | grep APP'

if gopass is the only summon provider no flag is needed
[I] ➜ summon -f secrets.yml bash -c 'env | grep APP'

if the secrets.tml file is in the current directory it does not need to be specified
[I] ➜ summon bash -c 'env | grep APP'
