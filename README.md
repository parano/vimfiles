myVimfiles
==============

Clone this repo:
```
git clone git://github.com/parano/vimfiles.git ~/.vim
```

### Vim/MacVim Installation (Macos)

``` 
brew install vim --with-lua --with-python3 --with-override-system-vi
```
```
brew install macvim --with-lua --with-python3 --with-override-system-vim
brew linkapps macvim
```

Link vimrc file:
```
ln -s ~/.vim/vimrc ~/.vimrc
```

### Neovim Installation (Macos)
```
brew install neovim/neovim/neovim
pip2 install neovim
pip3 install neovim
```

link newvim config files:
```
mkdir ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
```

### Configurations

Install plug.vim
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install Dependencies:
``` 
brew install the_silver_searcher
```

Create folders for backup files
``` 
mkdir -p ~/.vim/swaps ~/.vim/backups 
```

Run `:PlugInstall` to install plugins.

For Javascript/Python auto-complete:
```
pip install jedi
```
```
npm install -g tern
```




### Trouble shotting

Having problem with <C-h>? see https://github.com/neovim/neovim/issues/2048
