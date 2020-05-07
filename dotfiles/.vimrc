
" the <Esc> key for leaving insert mode is antiquated.
" Vim is about efficiency, and it's hardly efficient to leave the home keys if you don't have to.
inoremap jk <ESC>

" The default leader () key seems rather out of the way as well, so I like to remap the leader key to Space.
let mapleader = " "



" Arrows keys are unvimlike
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
