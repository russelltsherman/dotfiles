# Tmux Panes (splits)

Tmux has an option to split a single Tmux session window into multiple smaller windows called Tmux panes.  This way we can run different programs on each pane and interact with all of them simultaneously.  Each pane can be resized, moved and closed without affecting the other panes.  We can split a Tmux window either horizontally or vertically or both at once.

`<prefix> "` split a pane horizontally 
`<prefix> %` split a pane vertically 
`<prefix> Arrow` keys (Left, Right, Up, Down)
`<prefix> o` swap panes
`<prefix> q` show pane numbers (type the number to goto that pane)
`<prefix> x` kill pane
`<prefix> z` toggle zoom pane
`<prefix> +` break pane into window (e.g. to select text by mouse to copy)
`<prefix> -` restore pane from window
`<prefix> {` Move the current pane left
`<prefix> }` Move the current pane right
⍽  space - toggle between layouts

## Resizing Panes

You can also resize panes if you don’t like the layout defaults. I personally rarely need to do this, though it’s handy to know how. Here is the basic syntax to resize panes:

    PREFIX : resize-pane -D (Resizes the current pane down)
    PREFIX : resize-pane -U (Resizes the current pane upward)
    PREFIX : resize-pane -L (Resizes the current pane left)
    PREFIX : resize-pane -R (Resizes the current pane right)
    PREFIX : resize-pane -D 20 (Resizes the current pane down by 20 cells)
    PREFIX : resize-pane -U 20 (Resizes the current pane upward by 20 cells)
    PREFIX : resize-pane -L 20 (Resizes the current pane left by 20 cells)
    PREFIX : resize-pane -R 20 (Resizes the current pane right by 20 cells)
    PREFIX : resize-pane -t 2 20 (Resizes the pane with the id of 2 down by 20 cells)
    PREFIX : resize-pane -t -L 20 (Resizes the pane with the id of 2 left by 20 cells)

## Sync Panes

You can do this by switching to the appropriate window, typing your Tmux prefix (commonly Ctrl-B or Ctrl-A) and then a colon to bring up a Tmux command line, and typing:

```
:setw synchronize-panes
```

You can optionally add on or off to specify which state you want; otherwise the option is simply toggled. 
This option is specific to one window, so it won’t change the way your other sessions or windows operate. When you’re done, toggle it off again by repeating the command. [tip source](http://blog.sanctum.geek.nz/sync-tmux-panes/)
