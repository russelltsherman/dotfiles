#!/usr/bin/env zsh

#
# Z Shell Startup File
#

# `.zprofile' is similar to `.zlogin', except that it is sourced before `.zshrc'.
# `.zprofile' is meant as an alternative to `.zlogin' for ksh fans; the two are not intended to be used together, although this could certainly be done if desired.

#
# load machine specific configuration
#
[ -f "$0.local" ] && source "$0.local"
