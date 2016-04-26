"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start      " Backspace behaviour is normal
set history=10000                    " Lots of history
set nocompatible                    " be iMproved, required
set undofile
set undodir=~/.vim/undodir
set undolevels=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout                                                                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nowrap        " Don't wrap text
set expandtab     " Expand all tabs to spaces
set smarttab      " Insert tabs smartly
set autoindent    " Indent properly
set smartindent   " Automatically insert indents smartly
" It works, that's all I know... Discovered with a lot of trial and error
set shiftwidth=2  " Shift movements move by 2
set softtabstop=0 " No idea :P
set tabstop=2     " No idea :P

" Folding
set foldmethod=indent  " Fold based on Indent
set foldlevel=99
set foldnestmax=3      " Deepest fold is 3 levels
set nofoldenable       " Don't fold by default
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
