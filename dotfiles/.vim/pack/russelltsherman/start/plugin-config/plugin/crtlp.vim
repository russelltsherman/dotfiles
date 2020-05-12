
" see here for further configuration options
" https://github.com/ctrlpvim/ctrlp.vim

" exclude files from ctrlp file search
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
