if has("gui_running")
    set t_Co=256
    set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12
    set guioptions-=r " Removes right hand scroll bar
    set background=dark
    colorscheme wombat
else
    if has('nvim')
        set termguicolors
        set t_Co=256
        set background=dark
        colorscheme wombat
    else
        set termguicolors
        set t_Co=256
        set background=dark
        colorscheme solarized8
    endif
endif
