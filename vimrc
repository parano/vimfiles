set nocompatible
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

"turn on syntax highlighting
syntax on
syntax enable
"turn on ftplugins and indent files
filetype plugin indent on

set backspace=indent,eol,start
set history=1000

set showcmd
set showmode

set incsearch
set hlsearch
set showmatch
set lazyredraw

set number
set showbreak=O00oo..
set wrap linebreak nolist

set directory=~/.vim/swaps
set backup
set backupdir=~/.vim/backups

set linespace=2

set cursorline

set laststatus=2
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']

"make <c-l> clear the highlight as well as redraw
nnoremap <C-c> :nohls<CR><C-L>
inoremap <C-c> <C-O>:nohls<CR>

"neocomplcache 
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1 
let g:neocomplcache_disable_auto_complete = 1 
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabRetainCompletionType=2

" Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
  let g:neocomplcache_omni_patterns = {} 
endif 
"turn let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' off needless toolbar on gvim/mvim
set guioptions-=T"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete "
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'"

"indent settings
set expandtab
set shiftwidth=4
set softtabstop=4
set textwidth=0
set smarttab
set autoindent
autocmd BufEnter *.md set filetype=markdown
autocmd FileType markdown setlocal textwidth=80
autocmd FileType html,htmldjango,haml,sass,scss,ruby,javascript,php,css setlocal tabstop=4 shiftwidth=2 softtabstop=2
autocmd FileType python set textwidth=0
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support


"indent_guides settings
"set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"some stuff to get the mouse going in term
set mouse=a

"hide buffers when not displayed
set hidden

let g:ScreenShot = {'Icon':0, 'Credits':0, 'force_background':'#FFFFFF'}

map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  colorscheme railscasts
  set guitablabel=%M%t
  set lines=40
  set columns=115

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
else
  "dont load csapprox if there is no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    "set term=gnome-256color
    "set term=ansi
    set t_Co=256
    set background=dark
    colorscheme ir_black
  else
    colorscheme default
  endif
endif

"Enabling Zencoding
let g:user_zen_settings = {
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'c',
      \  },
      \  'xml' : {
      \    'extends' : 'html',
      \  },
      \  'haml' : {
      \    'extends' : 'html',
      \  },
      \  'erb' : {
      \    'extends' : 'html',
      \  },
      \}
let g:user_zen_expandabbr_key='<c-k>'

"snipmate setup
try
  source ~/.vim/snippets/support_functions.vim
catch
  source ~/vimfiles/snippets/support_functions.vim
endtry
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()

  "if we're in a rails env then read in the rails snippets
  if filereadable("./config/environment.rb")
    try
      call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
      call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
    catch
      call ExtractSnips("~/vimfiles/snippets/ruby-rails", "ruby")
      call ExtractSnips("~/vimfiles/snippets/eruby-rails", "eruby")
    endtry
  endif

  try
    call ExtractSnips("~/.vim/snippets/html", "eruby")
    call ExtractSnips("~/.vim/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/snippets/html", "php")
  catch
    call ExtractSnips("~/vimfiles/snippets/html", "eruby")
    call ExtractSnips("~/vimfiles/snippets/html", "xhtml")
    call ExtractSnips("~/vimfiles/snippets/html", "php")
  endtry
endfunction

"indent_guides settings
"set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

"""Key mappings

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for inserting date
"2012-04-07 12:58
nmap <F3> a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

""key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"use ; to issue a command"
nnoremap ; :
let mapleader=","

" Nerd Tree 
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
"let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['\/$','\.rb$','\.py$','\.c$','\.js$','*','.txt$','.md$']
"let NERDTreeShowBookmarks=1
"let NERDTreeWinPos = "right"

" Tagbar
"let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0 
let g:tagbar_compact = 1

nnoremap <silent> <F5> :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>
nnoremap <silent> <F7> :TlistToggle<CR>
nnoremap <C-A> :IndentGuidesToggle<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>

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

" Latex preview
let tex_preview_always_autosave = 1
"let no_tex_maps = 1

"set fileencodings=utf8,cp936,gb18030,big5
set encoding=utf8





