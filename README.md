Parano's vim files
================

## Usage ##

Clone this repo into ```~/.vim```

``` git clone git://github.com/akitaonrails/vimfiles.git ~/.vim ```

'cd' into the ```~/.vim``` and git the submodules

```
git submodule update --init 
```

create a ```~/.vimrc``` 

``` 
echo "source ~/.vim/vimrc" > ~/.vimrc 
```

do it if you are using gvim :

```
echo "source ~/.vim/gvimrc" > ~/.gvimr 
```

create ```~/.vim/swaps``` and ```~/.vim/backups```

``` 
mkdir -p ~/.vim/swaps ~/.vim/backups 
```

## Dependencies ##
*Vim 7.3+
*Exuberant Ctags (http://ctags.sourceforge.net/)
*Python support for Vim
*Python 2.4+

have fun ;-)
