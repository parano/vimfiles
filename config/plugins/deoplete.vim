" Use deoplete.
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
      \'auto_complete_delay': 200,
      \'smart_case': v:true,
      \})

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"

" close preview window
autocmd CompleteDone * pclose!

" https://github.com/Shougo/deoplete.nvim/issues/694
"let g:deoplete#num_processes = 1
