"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug                                                                                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Setting up vim-plug
let vim_plug_installed=1
let plug_vim=expand('~/.vim/autoload/plug.vim')
" If vim-plug file is absent, install vim-plug
if !filereadable(plug_vim)
  echo "Installing Vim-Plug.."
  echo ""
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let vim_plug_installed=0
endif


call plug#begin('~/.vim/plugged')


" Filetype specific
Plug 'ap/vim-css-color', { 'for': 'css'}                          " Colored css
Plug 'suan/vim-instant-markdown', {'for' : 'markdown'}            " Display Markdown
Plug 'funorpain/vim-cpplint', {'for' : ['cpp', 'c', 'arduino'] }  " Cpplint checker
Plug 'derekwyatt/vim-scala'                                       " Scala
"Plug 'LaTeX-Box-Team/LaTeX-Box'                                   " LaTeX plugin
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'

" Utilities
Plug 'Shougo/unite.vim'                                           " Something very powerful(trying to learn)
Plug 'Chiel92/vim-autoformat'                                     " AutoFormat
Plug 'scrooloose/nerdcommenter'                                   " Good Commenting
Plug 'Lokaltog/vim-easymotion'                                    " Easy Motion search
Plug 'scrooloose/nerdtree'                                        " File Browsing
Plug 'majutsushi/tagbar'                                          " Tagbar ( Display info on structure of code)
Plug 'Yggdroot/indentLine'                                        " Show indents
Plug 'godlygeek/tabular'                                          " Table Settings
"Plug 'scrooloose/syntastic'                                       " Syntax Checker

" Autocomplete
"Plug 'vim-scripts/AutoComplPop'                                   " Pop autocomplete
"Plug 'ervandew/supertab'                                          " Autocomplete on Tab
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }           " Autocomplete while typing
if has('nvim')
  Plug 'vim-airline/vim-airline'                                  " Powerful statusline
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
else
  Plug 'Shougo/neocomplete.vim'
endif

" Looks
Plug 'yashsriv/vim-airline-harlequin'                             " My own colorscheme for airline
Plug 'flazz/vim-colorschemes'                                     " Vim Colorschemes
Plug 'bronson/vim-trailing-whitespace'                            " Show Trailing Spaces
call plug#end()                                                   " required

" Install Plugins if they are not installed
if vim_plug_installed== 0
  echo "Installing Plugins, please ignore key map error messages"
  echo ""
  :PlugInstall
endif

if exists('g:ycm_semantic_triggers')
  " YCM settings for less irritating behaviour
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_autoclose_preview_window_after_insertion = 1
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_semantic_triggers={'html': ['<', '</'], 'css': [ 're!^\s{4}', 're!:\s+' ]}
endif

if has('nvim')
  " Airline Settings
  let g:airline_powerline_fonts  = 1
  let g:airline_theme="harlequin"
  let g:airline#extensions#tabline#enabled = 1
  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :deoplete#mappings#manual_complete()
else
  if exists('g:neocomplete#enable_at_startup')
    let g:neocomplete#enable_at_startup = 1
  endif
endif
