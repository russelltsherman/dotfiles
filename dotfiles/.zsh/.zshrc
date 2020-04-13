#!/usr/bin/env bash
# shellcheck disable=SC2206

#
# Z Shell Startup File
#

# `.zshrc' is sourced in interactive shells.
# It should contain commands to set up aliases, functions, options, key bindings, etc.

##############################################################################
# ===== Basic options == SEE http://zsh.sourceforge.net/Doc/Release/Options.html
##############################################################################
setopt ALWAYS_TO_END # move cursor to end if word had one match
setopt AUTO_CD # cd by typing directory name if it's not a command
setopt AUTO_LIST # automatically list choices on ambiguous completion
setopt AUTO_MENU # automatically use menu completion
setopt CORRECT_ALL # autocorrect commands
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells
setopt INC_APPEND_HISTORY # save history entries as soon as they are entered
setopt HIST_REDUCE_BLANKS # remove superfluous blanks from history items
setopt SHARE_HISTORY # share history between different instances of the shell

#
# load machine specific configuration
#
[ -f "$0.local" ] && source "$0.local"
