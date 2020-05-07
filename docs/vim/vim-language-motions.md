# vim motions

| Keybinding         | Operation                            |
| ------------------ | ------------------------------------ |
| %                  | go to first matching paren / bracket |
| [count] +          | down to first non-blank char of line |
| [count] \$         | to end of line                       |
| [count] f/F {char} | to next occurence of [char]          |
| [count] t/T {char} | to before next occurence of [char]   |
| [count] h/j/k/l    | left, down, up, or right             |
| [count] ]m         | go to beginning of next method       |
| [count] w/W        | go a word / WORD right               |
| [count] b/B        | go a word / WORD left                |
| [count] e/E        | go to end of word / WORD right       |

[count][operator][text object / motion ]

6+ = 6x go down to line start
gUaW = capitalize a WORD
3ce = 3x change to word end
4\$ = 4x go to end of line
d]m = delete to start of next method
% = jump to mathc of next paren or bracket
