" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
  \ [ '.git/', '*.swp$/', '__pycache__/',
  \   '.jsx.js$', 'images/', '*.min.*', 'img/', 'fonts/'])

" Change mappings.
call denite#custom#map(
  \ 'insert',
  \ '<C-j>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)
call denite#custom#map(
  \ 'insert',
  \ '<C-k>',
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)

" Change file_rec command.
call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Define alias
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
  \ ['git', 'ls-tree', '-r', '--name-only', 'HEAD', '--', ':/'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])

" search file buffer
noremap <leader>b :<C-u>Denite buffer<cr>

" search file in git repo
noremap <leader>t :<C-u>Denite file_rec/git<cr>

" search file in current folder
noremap <leader>c :<C-u>Denite file_rec<cr>

" search keyword with ripgrep
noremap <leader>g :<C-u>Denite grep<cr>
