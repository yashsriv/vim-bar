"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors                                                                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256          " Enable 256-color mode
syntax on             " Enable syntax processing
set background=dark
if strftime("%H") >= g:day_start && strftime("%H") < g:day_end
  colorscheme solarized8_dark_flat
else
  colorscheme harlequin
endif
