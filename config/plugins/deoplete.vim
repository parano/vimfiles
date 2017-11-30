let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

" Ternjs
let g:tern_request_timeout = 1

"Add extra filetypes
let g:tern#filetypes = [
  \ 'javascript',
  \ 'javascript.jsx'
  \ ]

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"

" close preview window
autocmd CompleteDone * pclose!
