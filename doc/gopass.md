# GOPASS

[gopass](https://www.gopass.pw/) is a simple but powerful password manager for your terminal.

```txt
[I] ➜ gopass -h
NAME:
   gopass - The standard unix password manager - rewritten in Go

USAGE:
   gopass [global options] command [command options] [arguments...]

VERSION:
   1.8.6

COMMANDS:
     agent               Start gopass-agent
     audit               Scan for weak passwords
     binary, bin         Assist with Binary/Base64 content
     clone               Clone a store from git
     completion          Bash and ZSH completion
     config              Edit configuration
     copy, cp            Copy secrets from one location to another
     create, new         Easy creation of new secrets
     delete, remove, rm  Remove secrets
     edit, set           Edit new or existing secrets
     find, search        Search for secrets
     fsck                Check store integrity
     generate            Generate a new password
     git-credential      Use "!gopass git-credential $@" as git's credential.helper
     jsonapi             Run and configure gopass as jsonapi e.g. for browser plugins
     otp, totp, hotp     Generate time- or hmac-based tokens
     git                 Run a git command inside a password store (init, remote, push, pull)
     grep                Search for secrets files containing search-string when decrypted.
     history, hist       Show password history
     init                Initialize new password store.
     insert              Insert a new secret
     list, ls            List existing secrets
     move, mv            Move secrets from one location to another
     mounts              Edit mounted stores
     recipients          Edit recipient permissions
     show                Display a secret
     sync                Sync all local stores with their remotes
     templates           Edit templates
     update              Check for updates
     version             Display version
     xc                  Experimental Crypto
     help, h             Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --yes          Assume yes on all yes/no questions or use the default on all others
   --clip, -c     Copy the first line of the secret into the clipboard
   --help, -h     show help
   --version, -v  print the version
```

initialize pass db using our gpg key id
`pass init 86A68612`

create a secret
`pass insert Business/cheese-whiz-factory`

fetch a secret
`pass Business/cheese-whiz-factory`

will need to reenter gpg pin periodically
