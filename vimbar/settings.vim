"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start      " Backspace behaviour is normal
set history=10000                    " Lots of history
if !has('nvim')
  set nocompatible                    " be iMproved, required
endif
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
