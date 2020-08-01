"!Plug.vim
call plug#begin('~/.local/share/nvim/plugged')

Plug 'xolox/vim-misc'
Plug 'tpope/vim-sensible'

Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'

Plug 'shougo/denite.nvim'

"" syntax checking and highlighting
Plug 'vim-syntastic/syntastic'

" colors, themes
Plug 'lifepillar/vim-solarized8'
Plug 'nanotech/jellybeans.vim'

" auto completion with deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  pythonx import pynvim
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Auto completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate'

" tabnine auto complete
Plug 'zxqfl/tabnine-vim'


""" Language specific plugins

" Python
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'nvie/vim-flake8'

" Scala
"Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
"Plug 'ensime/ensime-vim'

" Go
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" javascript
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/html5.vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Typescript
"Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }



""" Build & Dev Tool specific plugins

" docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

" jsonnet
"Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }

" Bazel
"Plug 'google/vim-ft-bzl', { 'for': 'bzl' }

" Nginx
Plug 'chr4/nginx.vim'

" YAML
Plug 'ingydotnet/yaml-vim'

" JSON
Plug 'elzr/vim-json', { 'for': 'json' }


" GraphQL
"Plug 'jparise/vim-graphql'

call plug#end()

" Basic settings and key bindings
source ~/.vim/config/general.vim

" additional configs
source ~/.vim/config/colors.vim
source ~/.vim/config/emacs.vim
source ~/.vim/config/lastcursor.vim
source ~/.vim/config/search.vim

" optional
"source ~/.vim/config/numbering.vim

" Plugin configurations
source ~/.vim/config/plugins/airline.vim
source ~/.vim/config/plugins/denite.vim
source ~/.vim/config/plugins/syntastic.vim
source ~/.vim/config/plugins/gitgutter.vim
source ~/.vim/config/plugins/nerdtree.vim
source ~/.vim/config/plugins/deoplete.vim
"source ~/.vim/config/plugins/go.vim
"source ~/.vim/config/plugins/javascript-libraries.vim

