" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

" Ternjs
let g:tern_request_timeout = 1

"Add extra filetypes
let g:tern#filetypes = [
  \ 'js',
  \ 'jsx',
  \ 'ts'
  \ ]

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"

" close preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
