# vim windows

| Keybinding     | Operation                        |
| -------------- | -------------------------------- |
| <Ctrl-w> s     | split window horizontally        |
| <Ctrl-w> v     | split window vertically          |
| <Ctrl-w> q     | close window                     |
| <Ctrl-w> w     | alternate window                 |
| <Ctrl-w> r     | rotate windows                   |
| <Ctrl-w> T     | extract window into new tab      |
| :windo {cmd}   | execute {cmd} for all windows    |
| :vert {cmd}    | make any split {cmd} be vertical |
| :split {file}  | split window and :find {file}    |
| :vsplit {file} | split window and :find {file}    |

## navigating windows

| Keybinding | Operation                 |
| ---------- | ------------------------- |
| <Ctrl-w> h | switch window focus left  |
| <Ctrl-w> j | switch window focus down  |
| <Ctrl-w> k | switch window focus up    |
| <Ctrl-w> l | switch window focus right |

## resizing windows

| Keybinding       | Operation                     |
| ---------------- | ----------------------------- |
| <Ctrl-w> <num> + | increase height               |
| <Ctrl-w> <num> - | decrease height               |
| <Ctrl-w> \_      | maximize height               |
| <Ctrl-w> <num> > | increase width                |
| <Ctrl-w> <num> < | decrease width                |
| <Ctrl-w> <num>   | maximize width                |
| <Ctrl-w> =       | reset the size of all windows |
