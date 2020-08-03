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

call denite#custom#source('_', 'matchers', ['matcher_fuzzy'])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])

if executable('rg')
	call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', '--glob', '!__pycache__'])
	call denite#custom#var('grep', 'command', ['rg'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'final_opts', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('greo', 'default_opts', ['--vimgrep', '--no-heading'])
endif

" search file buffer
nnoremap <silent> <Leader>b :<C-u>Denite buffer -start-filter<cr>

" search file in git repo
nnoremap <silent> <Leader>t :<C-u>Denite file/rec/git -start-filter<cr>

" search file under current directory
nnoremap <silent> <Leader>f :<C-u>Denite file/rec -start-filter<cr>

" search keyword with ripgrep
nnoremap <silent> <Leader>g :<C-u>Denite grep<cr>


" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
