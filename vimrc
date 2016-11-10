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
autocmd FileType html,css,less,haml,sass,scss,ruby,javascript,jade,jsx,coffee,python,bzl setlocal tabstop=2 shiftwidth=2 softtabstop=2 linespace=2
"autocmd FileType python set textwidth=0

let g:syntastic_javascript_checkers = ['eslint']

" some stuff to get the mouse going in term
set mouse=a

if has("gui_running")
    set t_Co=256
    set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12
    set guioptions-=r " Removes right hand scroll bar
    set background=dark
    colorscheme wombat
else
    if $COLORTERM == 'gnome-terminal'
        "set term=gnome-256color
        "set term=ansi
        set t_Co=256
        set background=dark
        colorscheme my_ir_black
    else
        set t_Co=256
        set background=dark
        colorscheme my_ir_black
    endif
endif

"set cursorline
set laststatus=2
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

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
let g:neosnippet#enable_snipmate_compatibility = 1

let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory="~/.vim/bundle/vim-snippets/snippets/"

" Plugin key-mappings.
imap <C-i>     <Plug>(neosnippet_expand_or_jump)
smap <C-i>     <Plug>(neosnippet_expand_or_jump)
xmap <C-i>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"hide buffers when not displayed
set hidden

map <F1> <Esc>:w<CR>
imap <F1> <Esc>:w<CR>
map <F7> <Esc>:checktime<CR>
imap <F7> <Esc>:checktime<CR>
map <F8> <Esc>:Errors<CR>

" ctrlp
let g:ctrlp_map = ',t'
let g:ctrlp_working_path_mode = 2

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

set ignorecase

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
nmap <M-[> <<
nmap <M-]> >>
vmap <M-[> <gv
vmap <M-]> >gv

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
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '\.swp$', '\.jsx.js$']
let NERDTreeSortOrder=['\/$','\.rb$','\.py$','\.c$','\.js$','*','.txt$','.md$']
nnoremap <silent> <F5> :execute 'NERDTreeToggle ' . getcwd()<CR>
" close vim if the only window left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
nmap <F6> :TagbarToggle<cr>

nnoremap / /\v\c
vnoremap / /\v\c

"key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>
let g:gundo_right=1
let g:gundo_width=60

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

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" copy yanked text to clipboard
vnoremap <C-c> "+y

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

" press SPACE to fold/unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" GitGutter
let g:gitgutter_max_signs = 1000

" vim indent guides
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 4

" Unite
let g:unite_source_history_yank_enable = 1
let s:unite_source = {'name': 'colorscheme', }
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>c :Unite grep:.<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" easier buffer
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" disable visual bell
set noerrorbells
set novisualbell
set visualbell t_vb=

" auto save session
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

highlight ColorColumn ctermbg=magenta

" js
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_chai = 1
autocmd BufReadPre *.js let b:javascript_lib_use_flux = 1

call matchadd('ColorColumn', '\%101v', 100)

inoremap kj <Esc>

set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,gb18030,big5

" the same as autochdir
autocmd BufEnter * silent! lcd %:p:h
