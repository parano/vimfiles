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
if has('nvim')
    nmap <BS> <C-W>h
endif

" Number of undo levels.
if &undolevels < 200
    set undolevels=200
endif

" indent settings
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=0
set linespace=2
set smarttab
set autoindent

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.jsonnet.TEMPLATE set filetype=jsonnet

autocmd FileType markdown setlocal textwidth=80
autocmd FileType python set textwidth=0
autocmd FileType javascript,javascript.jsx set colorcolumn=100

au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile nginx*.conf set ft=nginx
au BufRead,BufNewFile *nginx.conf set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile */*nginx*/*.conf set ft=nginx

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

" copy paste :D
set clipboard=unnamed

" disable visual bell
set noerrorbells
set novisualbell
set visualbell t_vb=

" toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

inoremap jj <Esc><Esc>
inoremap jk <Esc><Esc>
inoremap kj <Esc><Esc>

" use 2 space indentation for jsonnet
let g:jsonnet_fmt_options = ' -n 2'
