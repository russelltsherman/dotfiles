""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" the <Esc> key for leaving insert mode is antiquated.
" Vim is about efficiency, and it's hardly efficient to
" leave the home keys if you don't have to.
inoremap jk <ESC>
inoremap kj <Esc>

" The default leader () key seems rather out of the way as well,
" so I like to remap the leader key to Space.
let g:mapleader = " "

" leader shift hjkl to create splits
nnoremap <Leader>H :vsplit<CR>
nnoremap <Leader>J :split<CR>
nnoremap <Leader>K :split<CR>
nnoremap <Leader>L :vsplit<CR>

" ctrl hjkl to shift focus
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" leader hjkl to resize windows
nnoremap <Leader>h :vertical :resize -2<CR>
nnoremap <Leader>j :resize -2<CR>
nnoremap <Leader>k :resize +2<CR>
nnoremap <Leader>l :vertical :resize +2<CR>

" " disable arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
