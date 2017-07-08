" Nerd Tree 
let NERDChristmasTree=1
let NERDTreeWinSize=25
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.git$', '\.swp$', '\.jsx.js$']
let NERDTreeSortOrder=['\/$','\.rb$','\.py$','\.c$','\.js$','*','.txt$','.md$']
nnoremap <silent> <F5> :execute 'NERDTreeToggle ' . getcwd()<CR>
nmap <leader>ne :NERDTreeToggle<cr>
" close vim if the only window left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
