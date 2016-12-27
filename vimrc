"!Plug.vim
call plug#begin('~/.local/share/nvim/plugged')

Plug 'xolox/vim-misc'
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'shougo/denite.nvim'

Plug 'vim-syntastic/syntastic'

" Code auto completion
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'zchee/deoplete-jedi', { 'for': ['python'] } " python code auto completion

" Auto completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate'

" scala
Plug 'derekwyatt/vim-scala', {'for' : 'scala'}
"Plug 'ensime/ensime-vim'

" javascript
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/html5.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json'

" Bazel
Plug 'google/vim-ft-bzl', { 'for': ['bzl'] }

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

" Number of undo levels.
if &undolevels < 200
    set undolevels=200
endif

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

" toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

inoremap jj <Esc><Esc>
inoremap jk <Esc><Esc>
inoremap kj <Esc><Esc>
