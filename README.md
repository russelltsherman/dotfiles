# Dotfiles

baseline provisioning of OSX workstations

## Usage

1. `git clone https://github.com/russelltsherman/dotfiles` to pull down the repository
1. `make init` to initialize the [`build-harness`](https://github.com/opsbot/build-harness/)
1. `make bootstrap` to initialize workstation apps and settings

this script does the following

- install [Homebrew package manager](https://brew.sh)
- install cli and gui apps from [Brewfile](./Brewfile)

## Adblocking Hosts file

Use this file to prevent your computer from connecting to selected internet hosts.
This is an easy and effective way to protect you from many types of spyware,
reduces bandwidth use, blocks certain pop-up traps, prevents user tracking by
way of "web bugs" embedded in spam, provides partial protection to IE from certain
web-based exploits and blocks most advertising you would otherwise be subjected
to on the internet.

```sh
make -B /etc/hosts
```

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/russelltsherman/dotfiles/issues) to report any bugs or file feature requests.

### Developing

PRs are welcome. We follow the typical "git-flow" Git workflow.

 1. **Clone** the project to your own machine
 1. **Commit** changes to your own branch
 1. **Push** your work back up to your fork
 1. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest upstream changes before making a pull request!
