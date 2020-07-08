# Z shell Configuration

The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.

macOS Catalina, released in October 2019, adopted Zsh as the default shell, replacing Bash.

## The Zsh Startup Files

Like most shells, zsh processes a number of system and user startup files. It is very important to understand the order in which each file is read, and what conditions cause various files to be ignored. Otherwise, you may be entering commands and configurations into your startup files that aren't getting seen or executed by zsh.

## The Startup Process

When zsh starts up, the following files are read (in order):

- First, read /etc/zshenv, followed by \$ZDOTDIR/.zshenv.
  - If the RCS option is unset in this system file, all other startup files are skipped.
- IF is a login shell, read /etc/zprofile , followed by \$ZDOTDIR/.zprofile.
- IF is interactive, read /etc/zshrc , followed by \$ZDOTDIR/.zshrc.
- IF is a login shell, read /etc/zlogin , followed by \$ZDOTDIR/.zlogin.

ZDOTDIR is set to the user's home directory by default.
To look in another directory, set ZDOTDIR to where you'd like zsh to look.

## Logging Out

When a user logs out,

- First /etc/zlogout is read, followed by \$ZDOTDIR/.zlogout.
