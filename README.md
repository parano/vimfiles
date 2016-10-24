Vimfiles
================
JavaScript/Scala/Ruby centric vimfiles and installer

## Quick Install ##

Clone this repo into ```~/.vim```

``` 
git clone git://github.com/parano/vimfiles.git ~/.vim 
```

Create link for ```~/.vimrc```

```
ln -s ~/.vim/vimrc ~/.vimrc
```

Set up Vundle

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```


Install bundled plugins

```
vim +BundleInstall +qall
```


Build vimproc
```
cd ~/.vim/bundle/vimproc.vim && make
```

Create ```~/.vim/swaps``` and ```~/.vim/backups```.

``` 
mkdir -p ~/.vim/swaps ~/.vim/backups 
```

## Dependencies ##
* Vim 7.3+ with Lua enabled
* Exuberant Ctags (http://ctags.sourceforge.net/)
* Python support for Vim
* ack-grep
* Python 2.4+

For Mac users, simply do
``` 
brew install vim --with-lua --with-override-system-vim 
brew install ctags ack 
```

Mac Vim:
```
brew install macvim --with-cscope --with-lua --with-override-system-vim 
brew linkapps macvim
```

## Key Bindings

* F1 - Quick Save
* F2 - Toggle Paste Mode
* F3 - Insert current time
* F4 - GundoToggle
* F5 - NERDTreeToggle
* F6 - TagbarToggle
* F7 - Checktime - reload files
* F8 - Show errors

## Notes

* Neocomplete requires Vim 7.3.885+ with Lua enabled. Refer to
[Neocomplete.vim](https://github.com/Shougo/neocomplete.vim) for more
installation instructions. 

* To have a nicer looking status bar, pick and install a font from [Powerline
Fonts](https://github.com/Lokaltog/powerline-fonts) and patch it to your
terminal environment.


have fun ;-)
