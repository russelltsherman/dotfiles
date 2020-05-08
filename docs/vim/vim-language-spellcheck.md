# spellchecking

We'd be in pretty bad shape if we couldn't spellcheck, and vim does it quite well. First we need to set the option within our conf file.

| Key | Operation                                                           |
| --- | ------------------------------------------------------------------- |
| c   | change from current position to/through next motion/text object/etc |
| ]s  | Go to the next misspelled word                                      |
| [s  | Go to the last misspelled word                                      |
| z=  | When on a misspelled word, get some suggestions                     |
| zg  | Mark a misspelled word as correct                                   |
| zw  | Mark a good word as misspelled                                      |

Fix spelling with <leader>f
nnoremap <leader>f 1z=

Toggle spelling visuals with <leader>s
nnoremap <leader>s :set spell!
