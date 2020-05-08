# vim motions

## basic motions

| Key | Operation                |
| --- | ------------------------ |
| h   | move left one character  |
| j   | move down one line       |
| k   | move up one line         |
| l   | move right one character |

## moving within a line

| Key     | Operation                                         |
| ------- | ------------------------------------------------- |
| 0       | move to the beginning of the line                 |
| \$      | move to the end of the line                       |
| ^       | move to the first non-blank character in the line |
| f{char} | move to before next occurence of [char]           |
| F{char} | move to before next occurence of [char]           |
| t{char} | move to next occurence of [char]                  |
| T{char} | move to next occurence of [char]                  |
| %       | move to next matching paren / bracket             |
| +       | move down to first non-blank char of line         |
| ]m      | move to beginning of next method                  |

, and ; will repeat the previous t and f jumps.

## moving by word

| Key | Operation                  |
| --- | -------------------------- |
| w   | move forward one word      |
| W   | move forward one big word  |
| b   | move backward one word     |
| B   | move backward one big word |
| e   | move to end of word right  |

## moving by sentence

| Key | Operation                  |
| --- | -------------------------- |
| )   | move forward one sentence  |
| }   | move forward one paragraph |

## moving by screen

| Key | Operation                         |
| --- | --------------------------------- |
| H   | move "high" == top of screen      |
| L   | move "low" == bottom of screen    |
| M   | move "middle" == bottom of screen |
| gg  | go to the top of the file         |
| G   | go to the bottom of the file      |
| ^U  | move up half a screen             |
| ^D  | move down half a screen           |
| ^F  | page down                         |
| ^B  | page up                           |

Ctrl-i: jump to your previous navigation location
Ctrl-o: jump back to where you were

[count][operator][text object / motion ]

6+ = 6x move down to line start
gUaW = capitalize a WORD
3ce = 3x change to word end
4\$ = 4x move to end of line
d]m = delete to start of next method
