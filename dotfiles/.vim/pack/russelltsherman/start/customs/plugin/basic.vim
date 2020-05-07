""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn off compatibility mode and enter the new millennium
set nocompatible

" the <Esc> key for leaving insert mode is antiquated.
" Vim is about efficiency, and it's hardly efficient to leave the home keys if you don't have to.
inoremap jk <ESC>

" The default leader () key seems rather out of the way as well, so I like to remap the leader key to Space.
let mapleader = " "

syntax enable         " enable syntax highlighting
syntax on             " turn on syntax highlighting

filetype plugin on    " If filetype detection was not switched on yet, it will be.
                      " This actually loads the file "ftplugin.vim" in 'runtimepath'.
                      " The result is that when a file is edited its plugin file is
                      " loaded (if there is one for the detected filetypefiletype).
filetype indent on    " If filetype detection was not switched on yet, it will be.
                      " This actually loads the file "indent.vim" in 'runtimepath'.
                      " The result is that when a file is edited its indent file is
                      " loaded (if there is one for the detected filetype).

set ai                " auto indent
set si                " smart indent
set history=1000      " keep 1000 items in history

" Arrows keys are unvimlike
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
