if has("gui_running")
  set t_Co=256
  set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12
  set guioptions-=r " Removes right hand scroll bar
  set background=dark
  colorscheme solarized8
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
    let g:jellybeans_overrides = {
          \    'background': { 'guibg': '212121' },
          \}

    colorscheme jellybeans
    "colorscheme solarized8
    "colorscheme solarized8_low
    "colorscheme solarized8_high
  endif
endif
