#!/usr/bin/env sh
# shellcheck disable=SC1090

#
# Z Shell Startup File
#

# `.zlogout' is sourced when login shells exit.

#
# load machine specific configuration
#
[ -f "$0.local" ] && . "$0.local"
