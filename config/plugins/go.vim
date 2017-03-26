
" Show a list of interfaces which is implemented by the type under your cursor with <leader>s
au FileType go nmap <leader>s <Plug>(go-implements)

" Show type info for the word under your cursor with <leader>i (useful if you have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <leader>i <Plug>(go-info)

" Jump to definition
au FileType go nmap <leader>d <Plug>(go-def)

"let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1
"let g:go_fmt_autosave = 0

au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
