
# Tmux Sessions

The default prefix shortcut to all commands in Tmux is Ctrl+b. 
Note: The default prefix to all Screen commands is Ctrl+a.

## Creating tmux session

`tmux` or `tmux new` create a new tmux session and attach to it
`tmux new -s <sessionname>` create a named tmux session and attach to it
`tmux new -s <sessionname> -d` create a detached session 

## list tmux sessions

`tmux ls`

## Attaching tmux sessions

`tmux a  #(a, at, or attach)`
`tmux a` attach to the last created session
`tmux a -t <sessionname>` attach to a named session

## Kill tmux sessions

`<prefix> x` kill the session currently attached
`tmux kill-session -t <sessionname>` kill a detached session
`tmux kill-server` stop tmux server and all created sessions

## additional useful commands

`<prefix> s` list active sessions
`<prefix> $` set or change session name
`<prefix> d` detach from current session
`<prefix> t` big clock
`<prefix> ?` list shortcuts
`<prefix> :` prompt

automatically attach to default tmux session when opening a terminal
add the following to your shell dotfiles

```sh
if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
```
