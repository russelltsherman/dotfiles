#!/usr/bin/env zsh

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

##############################################################################
# Z Shell Autocomplete Configuration
##############################################################################
setopt COMPLETE_IN_WORD # Allow completion from within a word/phrase
setopt ALWAYS_TO_END # When completing from the middle of a word, move the cursor to the end of the word

autoload -U compaudit compinit
zstyle ':completion:*' menu select

zmodload zsh/complist

ZCOMPDUMPFILE="$ZDOTCACHEDIR/.zcompdump-$ZSH_VERSION"
compinit -d "$ZCOMPDUMPFILE" -C
_comp_options+=(globdots) # Include hidden files.

##############################################################################
# Z Shell Colors Configuration
##############################################################################

autoload -U colors
colors

# The colors function records the names of colors and similar attributes
# (bold, underline and so on) in the associative array color.
# echo ${(o)color}

##############################################################################
# Z Shell History Configuration
##############################################################################

HISTDUP=erase                         # Erase duplicates in the history file
HISTFILE="$ZDOTCACHEDIR/.zsh_history" # History file location
HISTSIZE=1000                         # How many lines of history to keep in memory
SAVEHIST=1000                         # Number of history entries to save to disk

setopt APPEND_HISTORY # Allow multiple terminal sessions to all append to one zsh command history
setopt EXTENDED_HISTORY # Include more information about when the command was executed, etc
setopt HIST_IGNORE_DUPS # Do not write events to history that are duplicates of previous events
setopt HIST_REDUCE_BLANKS # remove superfluous blanks from history items
setopt INC_APPEND_HISTORY # save history entries as soon as they are entered
setopt SHARE_HISTORY # share history between different instances of the shell
setopt HIST_FIND_NO_DUPS # When searching history don't display results already cycled through twice

##############################################################################
# Z Shell Keybindings Configuration
##############################################################################

# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey -v # Default to standard vim bindings

# bindkey "^W"      kill-whole-line                      # ctrl-k
# bindkey "^R"      history-incremental-search-backward  # ctrl-r
# bindkey "^S"      history-incremental-search-forward   # ctrl-s
# bindkey "^A"      beginning-of-line                    # ctrl-a
# bindkey "^E"      end-of-line                          # ctrl-e
# bindkey "^N"      history-search-forward               # ctrl-n
# bindkey "^P"      history-search-backward              # ctrl-p
# bindkey "^D"      delete-char                          # ctrl-d
# bindkey "^F"      forward-char                         # ctrl-f
# bindkey "^B"      backward-char                        # ctrl-b

##############################################################################
# Z Shell Prompt Configuration
##############################################################################
setopt PROMPT_SUBST # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
# unsetopt MENU_COMPLETE

# set a default prompt
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

##############################################################################
# other customizations
##############################################################################

# initialize direnv shell hooks
type direnv &>/dev/null && eval "$(direnv hook ${SHELL})"

# initialize pyenv shell hooks
type pyenv &>/dev/null && eval "$(pyenv init -)"

# initialize pyenv virtualenv shell hooks
type pyenv &>/dev/null && eval "$(pyenv virtualenv-init -)"

source ~/.zsh/.zplugins
source ~/.zsh/.zfunctions
source ~/.zsh/.zaliases

#
# load machine specific configuration
#
[ -f "$0.local" ] && source "$0.local"
