"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI                                                                                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number                     " Show line number
set rnu                        " Relative line numbers
set cul                        " Highlight Current Line
set showcmd                    " Show command in bottom bar
"set showmode                   " Show current mode
filetype indent on             " Load filetype specific indent files
set wildmode=longest:list,full " Autocomplete on command line
set wildmenu                   " Enable ctrl-n and ctrl-p to scroll through matches
set wildignore=*.o,*.obj,*~    " Stuff to ignore
set lazyredraw                 " Redraw only when we need to
set showmatch                  " Showmatch highlight matching parenthesis
set scrolloff=5                " Minimum of two lines below and above cursor
set sidescrolloff=7            " Minimum of 7 characters right of cursor
set sidescroll=1
set ruler                      " Always show info along bottom
set incsearch                  " Incremental searching
set hlsearch                   " Highlight matches
set ignorecase                 " Case insensitive matching
set smartcase                  " Smart case matching
set list                       " Display all chars
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,eol:¬
set splitright                 " Vertical split on right instead of left
