i: insert before current character
I: insert before all current line characters (sans whitespace)
a: insert after current character
A: insert after all current line characters
r: replace current character (or each visually selected char)
R: enter replace mode
s: strike current character with following inserted text
S: strike entire line with following inserted text
h: move cursor left
H: "high" == top of screen == all the way "left" on the screen
l: move cursor right
L: "low" == bottom of screen == all the way "right" on the screen
(okay, these two were a stretch/coincidence ;)

v: visual stream mode
V: visual line mode (expands per-char concept to per-line)
w: next beginning of word
W: next beginning of word, delimited only by whitespace
e: next end of a word
E: next end of a word, delimited only by whitespace
n: previous beginning of a word
N: previous beginning of a word, delimited only by whitespace
ge: previous end of a word
gE: previous end of a word, delimited only by whitespace

same with text objects: iw/iW/aw/aW/ip/iP/ap/aP

There's another subset of commands wherein the shifted versions reverse direction:
fn: forward onto n
Fn: backward onto n
tn: to/till n
Tn: backward to/till n
n: next search match
N: previous search match
o: "open" a new line below the current one
O: open a new line above the current one
p: put after the cursor
P: put before the cursor
x: delete char after left edge of cursor (current char)
X: delete char before left edge of cursor
(note here that Vim is really always working from cursor's left edge)
/: search forward
?: (shifted /) search backward

There's a third subset of commands wherein the shifted versions are synonymous with n$, where n is the command, and $ means "to the end of the line", but it's still the same command (it just skips adding the \$ motion after the command):
