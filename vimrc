set nocompatible " be iMproved
filetype off " Vundle required!

" Vundle Settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vim/vimrc.bundles

" Vundle required! 
filetype plugin indent on 


" turn on syntax highlighting
syntax on

" backspace and delete problem
set backspace=indent,eol,start

" more history
set history=1000

" backup/swap file directory
set directory=~/.vim/swaps
set backup
set backupdir=~/.vim/backups

" status bar
set showcmd
set showmode
set number

" searching
set incsearch " incremental searching
set hlsearch " hightlight matching
set lazyredraw " do not redraw while running macros 

set showbreak=->
set wrap linebreak nolist " only manuly insert line breaks
set showmatch " show matching brackets for a moment

" indent settings
set expandtab
set shiftwidth=4
set softtabstop=4
set textwidth=0
set linespace=4
set smarttab
set autoindent
autocmd BufEnter *.md set filetype=markdown
autocmd FileType markdown setlocal textwidth=80
autocmd FileType html,css,less,haml,sass,scss,ruby,javascript,jade,coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2 linespace=2
autocmd FileType python set textwidth=0
autocmd Syntax javascript set syntax=jquery 

" some stuff to get the mouse going in term
set mouse=a

if has("gui_macvim")
    set mecmeta
endif

" colors, fonts
if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  if has("gui_gnome")
    set t_Co=256
    set term=gnome-256color
    colorscheme railscasts
    set guifont=Monospace\ Bold\ 12
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
    set enc=utf-8
  endif

  if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin"
      set go=aAce  " remove toolbar
      set guifont=Monaco:h13
      set guioptions-=r " Removes right hand scroll bar

      noremap <D-M-Left> :tabprevious<cr>
      noremap <D-M-Right> :tabnext<cr>
      map <D-1> 1gt
      map <D-2> 2gt
      map <D-3> 3gt
      map <D-4> 4gt
      map <D-5> 5gt
      map <D-6> 6gt
      map <D-7> 7gt
      map <D-8> 8gt
      map <D-9> 9gt
      map <D-0> :tablast<CR>
      set bg=dark
      if &background == "dark"
          hi normal guibg=black
          set transp=8
      endif
      color codeschool
    endif
  endif
else
  "dont load csapprox if there is no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    "set term=gnome-256color
    "set term=ansi
    set t_Co=256
    "set background=dark
    colorscheme my_ir_black
  else
    set t_Co=256
    "set background=dark
    "colorscheme solarized
    colorscheme my_ir_black
  endif
endif

"set cursorline
set laststatus=2
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']

"make <c-l> clear the highlight as well as redraw
nnoremap <C-c> :nohls<CR><C-L>
inoremap <C-c> <C-O>:nohls<CR>

" Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"" Sinppets
" Enable snipMate compatibility feature.
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Plugin key-mappings.
imap <C-i>     <Plug>(neosnippet_expand_or_jump)
smap <C-i>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-i>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"hide buffers when not displayed
set hidden

map <F1> <Esc>:w<CR>
imap <F1> <Esc>:w<CR>
map <C-r> :Errors<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

" key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" key mapping for inserting date
nmap <F3> a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" emacs keybinding
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
"imap <M-b> <C-o>b
"imap <M-f> <C-o>e<Right>
imap <C-d> <Del>
"imap <C-h> <BS>
"imap <M-d> <C-o>de
"imap <M-h> <C-w>
imap <C-k> <C-r>=<SID>kill_line()<CR>


function! s:home()
  let start_col = col('.')
  normal! ^
  if col('.') == start_col
    normal! 0
  endif
  return ''
endfunction

function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! s:split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction

"use ; to issue a command"
nnoremap ; :
let mapleader=","

" Nerd Tree 
let NERDChristmasTree=1
let NERDTreeWinSize=25
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '\.swp$']
let NERDTreeSortOrder=['\/$','\.rb$','\.py$','\.c$','\.js$','*','.txt$','.md$']
nnoremap <silent> <F5> :execute 'NERDTreeToggle ' . getcwd()<CR>

" Tagbar
let g:tagbar_left=0
let g:tagbar_width=30
nmap <F6> :TagbarToggle<cr>

let g:EasyMotion_leader_key = '<Leader>'

nnoremap / /\v
vnoremap / /\v

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>
let g:gundo_right=1


"""useful functions

"visual search mappings
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"jump to last cursor position when opening a file
""dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfunction

" toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
nnoremap <F7> :NumbersOnOff<CR>

set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,gb18030,big5
