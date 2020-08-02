My VIM configurations
==============

### VIM Installation (Mac OS)

Vim/MacVim Installation (MacOS)

``` 
brew install vim 
```

```
brew install macvim --with-lua --with-python3 --with-override-system-vim
brew linkapps macvim
```


For `deoplete.nvim` to work properly, install `pynvim`:
```
/usr/bin/pip3 install --user pynvim
```

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

Install Dependencies:
``` 
brew install the_silver_searcher ripgrep
```

Run `:PlugInstall` to install plugins.

### Optional configs

* For better auto-complete in Javascript Python:

```
pip install jedi
```
```
npm install -g tern
```

* To have a nicer looking status bar, install [Powerline
Fonts](https://github.com/Lokaltog/powerline-fonts) and patch it to your
terminal environment.

