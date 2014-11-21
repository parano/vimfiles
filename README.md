Vimfiles
================
JavaScript/Scala centric vimfiles and installer



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

## Key Bindings

* F1 - Quick Save
* F2 - Toggle Paste Mode
* F3 - Insert current time
* F4 - GundoToggle
* F5 - NERDTreeToggle
* F6 - TagbarToggle
* F7 - Toggle Numbers

## Notes

* Neocomplete requires Vim 7.3.885+ with Lua enabled. Refer to
[Neocomplete.vim](https://github.com/Shougo/neocomplete.vim) for more
installation instructions. For Mac users, a simple way to do that is override
the system vim via this command:
```
brew install vim --with-lua --override-system-vim
```

* To have a nicer looking status bar, pick and install a font from [Powerline
Fonts](https://github.com/Lokaltog/powerline-fonts) and patch it to your
terminal environment.


have fun ;-)
