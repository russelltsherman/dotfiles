#!/usr/bin/env sh
# shellcheck disable=SC1090
# shellcheck disable=SC1091
# shellcheck disable=SC2034

#
# Z Shell Startup File
#

##############################################################################
# add core utils to path https://www.gnu.org/software/coreutils
##############################################################################
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
# set path before compinin tries to use stat to be sure we use gnu stat

##############################################################################
# add findutils to path https://www.gnu.org/software/findutils
##############################################################################
export PATH="/usr/local/opt/findutils/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:${MANPATH}"

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
setopt GLOB_DOTS # Do not require a leading ‘.’ in a filename to be matched explicitly.

autoload -Uz compaudit compinit

daynum="$(date +'%j')"
filedaynum="$(date +'%j' -d "$(stat -c '%w' "$ZDOTDIR/.zcompdump" | cut -d' ' -f1)")"
if [ "$daynum" != "$filedaynum" ]
then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zmodload zsh/complist

##############################################################################
# Z Shell Colors Configuration
##############################################################################

autoload -U colors
colors

# The colors function records the names of colors and similar attributes
# (bold, underline and so on) in the associative array color.
# echo "${(o)color}"

##############################################################################
# Z Shell History Configuration
##############################################################################

HISTDUP=erase # Erase duplicates in the history file
HISTSIZE=1000 # How many lines of history to keep in memory
SAVEHIST=1000 # Number of history entries to save to disk

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
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

##############################################################################
# direnv and pyenv shell hooks
##############################################################################
command -v direnv > /dev/null && eval "$(direnv hook "$SHELL")"
command -v pyenv > /dev/null && eval "$(pyenv init -)"
command -v pyenv > /dev/null && eval "$(pyenv virtualenv-init -)"

##############################################################################
# iTerm2 may be integrated with the unix shell so that it can keep track of your command history,
# current working directory, host name, and more--even over ssh.
# load iterm2 shell integration if present
##############################################################################
. "$HOME/.iterm2_shell_integration.$(basename "$SHELL")"

##############################################################################
# do not initialize nvm untill it's called
##############################################################################
export NODE_VERSIONS=$HOME/.nvm/versions/node
export NVM_DIR="$HOME/.nvm"
[ ! -d "$NVM_DIR" ] && mkdir "$NVM_DIR" # ensure .nvm dir exists
nvm() {
  if [ -s "/usr/local/opt/nvm/nvm.sh" ]
  then
    . "/usr/local/opt/nvm/nvm.sh" # load nvm
    nvm "$@" # reissue original command
  fi
  # if npm not found we will install lastest node using node version manager
  command -v npm >/dev/null 2>&1 || (nvm install node)
}

# add yarn to path
if command -v yarn > /dev/null
then
  PATH="${PATH}:$(yarn global bin)"
  export PATH
fi

# initialize GO
if command -v go> /dev/null
then
  GOPATH="$HOME"
  PATH="${PATH}:${GOPATH}/bin"
  GOROOT="$(go env GOROOT)"
  alias gotour="\${GOPATH}/bin/gotour"
  export GOPATH
  export PATH
  export GOROOT
  export GO111MODULE=on
fi

##############################################################################
# plugins, functions, aliases
##############################################################################
. ~/.zsh/.zplugins
. ~/.zsh/.zdocker
. ~/.zsh/.zfunctions
. ~/.zsh/.zaliases

# neofetch is cool.. but it adds ~500ms load time to launching a new terminal
# neofetch

# pfetch isnt as cool as neofetch.. but has no significant impact on load time
pfetch

#
# load machine specific configuration
#
[ -f "$0.local" ] && . "$0.local"
