My VIM configurations
==============


### Configurations

Clone this repo:
```
git clone git://github.com/parano/vimfiles.git ~/.vim
```

Link vimrc file:
```
ln -s ~/.vim/vimrc ~/.vimrc
```

Create folders for backup files
``` 
mkdir -p ~/.vim/swaps ~/.vim/backups 
```

Install plug.vim
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run `:PlugInstall` to install all VIM plugins.


### Optional configs

Install ripgrep:
``` 
brew install ripgrep

# Or
cargo install ripgrep
```


Install Pyright:
```
:CocInstall coc-pyright
```
