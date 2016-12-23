"!Plug.vim
call plug#begin('~/.local/share/nvim/plugged')

Plug 'xolox/vim-misc'
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'shougo/denite.nvim'

" Auto completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate'

" scala
Plug 'derekwyatt/vim-scala' , {'for' : 'scala'}
"Plug 'ensime/ensime-vim'

" javascript
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'othree/html5.vim'

" Bazel
Plug 'google/vim-ft-bzl'

call plug#end()


if has("gui_running")
    set t_Co=256
    set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12
    set guioptions-=r " Removes right hand scroll bar
    set background=dark
    colorscheme wombat
else
    if has('nvim')
        set termguicolors
        set t_Co=256
        set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12
        set guioptions-=r " Removes right hand scroll bar
        set background=dark
        colorscheme wombat
    else
        set t_Co=256
        set background=dark
        colorscheme ir_black
    endif
endif

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

" some stuff to get the mouse going in term
set mouse=a

"hide buffers when not displayed
set hidden

"make <c-l> clear the highlight as well as redraw
nnoremap <C-c> :nohls<CR><C-L>
inoremap <C-c> <C-O>:nohls<CR>

" key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
autocmd FileType html,css,less,haml,sass,scss,ruby,javascript,jade,jsx,coffee,python,bzl setlocal tabstop=2 shiftwidth=2 softtabstop=2 linespace=2
autocmd FileType python set textwidth=0

"set cursorline
set laststatus=2
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" search better
nnoremap / /\v\c
vnoremap / /\v\c

" key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" key mapping for textmate-like indentation
nmap <M-[> <<
nmap <M-]> >>
vmap <M-[> <gv
vmap <M-]> >gv

"use ; to issue a command"
nnoremap ; :
let mapleader=","

" copy yanked text to clipboard
vnoremap <C-c> "+y

" disable visual bell
set noerrorbells
set novisualbell
set visualbell t_vb=

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
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

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" Nerd Tree 
let NERDChristmasTree=1
let NERDTreeWinSize=25
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.git$', '\.swp$', '\.jsx.js$']
let NERDTreeSortOrder=['\/$','\.rb$','\.py$','\.c$','\.js$','*','.txt$','.md$']
nnoremap <silent> <F5> :execute 'NERDTreeToggle ' . getcwd()<CR>
" close vim if the only window left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" GitGutter
let g:gitgutter_max_signs = 1000

" Denite
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

" search git repo
noremap <leader>t :<C-u>Denite file_rec/git<cr>
" search buffer
noremap <leader>b :<C-u>Denite buffer<cr>
" search with grep
noremap <leader>f :<C-u>Denite grep<cr>
" search current folder
noremap <leader>c :<C-u>Denite file_rec<cr>

"autocmd BufWritePost *.scala silent :EnTypeCheck
