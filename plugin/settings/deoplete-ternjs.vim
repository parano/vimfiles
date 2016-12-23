" Use deoplete.
let g:tern_request_timeout = 1

"Add extra filetypes
let g:tern#filetypes = [
  \ 'js',
  \ 'jsx',
  \ 'ts',
  \ ]

inoremap <expr><C-g> deoplete#undo_completion()
