
" see here for further configuration options
" https://github.com/weirongxu/coc-explorer

" Use preset argument to open it
nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>

" List all presets
nmap <space>el :CocList explPresets

" Explorer
" let g:coc_explorer_global_presets = {
" \   '.vim': {
" \      'root-uri': '~/.vim',
" \   },
" \   'floating': {
" \      'position': 'floating',
" \   },
" \   'floatingLeftside': {
" \      'position': 'floating',
" \      'floating-position': 'left-center',
" \      'floating-width': 50,
" \   },
" \   'floatingRightside': {
" \      'position': 'floating',
" \      'floating-position': 'left-center',
" \      'floating-width': 50,
" \   },
" \   'simplify': {
" \     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
" \   }
" \ }

" if coc-explorer is the last window standing go ahead and exit
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
