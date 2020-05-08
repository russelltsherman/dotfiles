# operators are the verbs of the vim language

operators act upon either text objects or motions

Sample operators

| Key | Operation                                                                |
| --- | ------------------------------------------------------------------------ |
| c   | change from current position to/through next motion/text object/etc      |
| C   | change from current position to end of line                              |
| d   | delete from current position to/through next motion/text object/etc      |
| D   | delete from current position to end of line                              |
| p   | paste the copied (or deleted) text after the current cursor position     |
| P   | paste the copied (or deleted) text before the current cursor position    |
| y   | yank (copy) from current position to/through next motion/text object/etc |
| yy  | yank (copy) the entire line                                              |
| v   | visually select (V for line vs. character)                               |
| ~   | swap case                                                                |
| gu  | make lowercase                                                           |
| gU  | make uppercase                                                           |
| !   | filter into external program                                             |
| <   | shift left                                                               |
| >   | shift right                                                              |
| =   | indent                                                                   |

u: undo your last action.
.: repeat your last action
Ctrl-r: redo the last action
