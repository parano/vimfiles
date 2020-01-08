My NeoVim configurations
==============

### NEOVIM Installation

Neovim Installation (MacOS)
```
brew install neovim/neovim/neovim
/usr/local/bin/pip2 install neovim
/usr/local/bin/pip3 install neovim
```

Optional Vim/MacVim Installation (MacOS)
``` 
brew install vim --with-lua --with-python3 --with-override-system-vi
```
```
brew install macvim --with-lua --with-python3 --with-override-system-vim
brew linkapps macvim
```

For `deoplete` to work properly, install `pynvim`:
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

link neovim config files:
```
mkdir ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
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
brew install the_silver_searcher
brew install ripgrep
```

Run `:PlugInstall` and `:UpdateRemotePlugins` to install plugins.

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

### Trouble shotting

Mac users having problem with `<C-h>`? see https://github.com/neovim/neovim/issues/2048

```
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```
