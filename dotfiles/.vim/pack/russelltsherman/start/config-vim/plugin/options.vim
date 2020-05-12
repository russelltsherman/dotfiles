""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM options configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://vimdoc.sourceforge.net/htmldoc/options.html

" turn off compatibility mode and enter the new millennium
set nocompatible

syntax enable   " enable syntax highlighting
syntax on       " turn on syntax highlighting

filetype plugin on    " If filetype detection was not switched on yet, it will be.
                      " This actually loads the file "ftplugin.vim" in 'runtimepath'.
                      " The result is that when a file is edited its plugin file is
                      " loaded (if there is one for the detected filetypefiletype).
filetype indent on    " If filetype detection was not switched on yet, it will be.
                      " This actually loads the file "indent.vim" in 'runtimepath'.
                      " The result is that when a file is edited its indent file is
                      " loaded (if there is one for the detected filetype).

set autoindent " Copy indent from current line when starting a new line
set autochdir " Your working directory will always be the same as your working directory
set cindent " Enables automatic C program indenting.
set clipboard=unnamedplus " Copy paste between vim and everything else
set cmdheight=2 " More space for displaying messages
set colorcolumn=+1  " a comma separated list of screen columns that are highlighted with ColorColumn
set conceallevel=0 " So that I can see `` in markdown files
set cursorline " Highlight the screen line of the cursor with CursorLine
set encoding=utf-8 " Sets the character encoding used inside Vim.
set expandtab " Use the appropriate number of spaces to insert a <Tab>.
set fileencoding=utf-8 " Sets the character encoding used when writing file
set formatoptions-=cro " Stop newline continution of comments
set hidden  " When on a buffer becomes hidden when it is |abandon|ed.
set history=1000      " keep 1000 items in history
set iskeyword+=- " treat dash separated words as a word text object"
set laststatus=0 " The value of this option influences when the last window will have a status line
set mouse=a " Enable the use of the mouse.
set nobackup " This is recommended by coc
" set noshowmode " We don't need to see things like -- INSERT -- anymore
" set nowrap  " When off lines will not wrap and only part of long lines will be displayed.
set nowritebackup " This is recommended by coc
set number " Print the line number in front of each line
set pumheight=10 " Makes popup menu smaller
set relativenumber " Show the line number relative to the line with the cursor
set ruler " Show the line and column number of the cursor position, separated by a comma.
set shiftwidth=2 " Number of spaces to use for each step of (auto)indent.
set showtabline=2 " Always show tabs
set smartindent " Do smart autoindenting when starting a new line.
set smarttab " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'
" set spell spelllang=en_us " enable spell checking
set splitbelow " Horizontal splits will automatically be below
set splitright " Vertical splits will automatically be to the right
set tabstop=2 " Number of spaces that a <Tab> in the file counts for.
set textwidth=100   " Maximum width of text that is being inserted.
set timeoutlen=100 " By default timeoutlen is 1000 ms
set updatetime=300 " Faster completion
set wrap  " lines longer than the width of the window will wrap and displaying continues on the next line.

set noerrorbells " visualbell t_vb=

highlight ColorColumn ctermbg=lightgrey guibg=lightgrey " set color for colorcolumn highlight
