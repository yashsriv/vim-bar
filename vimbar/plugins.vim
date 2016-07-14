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

" Function for installing plugins
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.vim/plugged')


" Filetype specific
"Plug 'LaTeX-Box-Team/LaTeX-Box'                                   " LaTeX plugin
Plug 'lervag/vimtex'                                                      " LaTeX plugin
Plug 'funorpain/vim-cpplint', {'for' : ['cpp', 'c', 'arduino'] }          " Cpplint checker
Plug 'octol/vim-cpp-enhanced-highlight', {'for' : 'cpp'}                  " Enhanced highlighting in cpp
Plug 'ap/vim-css-color', {'for': 'css'}                                   " Colored css
Plug 'suan/vim-instant-markdown', {'for' : 'markdown'}                    " Display Markdown
Plug 'derekwyatt/vim-scala', {'for': ['scala', 'sbt'] }                   " Scala
Plug 'ensime/ensime-vim', { 'do': function('DoRemote'), 'for': 'scala' }  " Ensime
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }  " Javascript

" Utilities
Plug 'Shougo/echodoc.vim'                                         " show documentation by echoing
Plug 'Yggdroot/indentLine'                                        " Show indents
Plug 'scrooloose/nerdcommenter'                                   " Good Commenting
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'   " File Browsing
Plug 'godlygeek/tabular'                                          " Table Settings
Plug 'majutsushi/tagbar'                                          " Tagbar ( Display info on structure of code)
" Supposedly causing errors in ensime, so I'm disabling it for the time being
"Plug 'Shougo/unite.vim'                                           " Something very powerful(trying to learn)
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'               " Snippets
Plug 'Chiel92/vim-autoformat'                                     " AutoFormat
Plug 'Lokaltog/vim-easymotion'                                    " Easy Motion search
Plug 'terryma/vim-multiple-cursors'                               " Multiple Cursors
Plug 'KabbAmine/zeavim.vim'                                       " Zeal

" Autocomplete
if has('nvim')
  Plug 'yashsriv/vim-airline-harlequin'                           " My own colorscheme for airline
  Plug 'vim-airline/vim-airline'                                  " Powerful statusline
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }     " Dark powered neocomplete
  Plug 'zchee/deoplete-jedi'                                      " Python completion
  Plug 'zchee/deoplete-clang'                                     " C Family completion
  Plug 'benekastah/neomake'                                       " Neomake
else
  Plug 'Shougo/neocomplete.vim'                                   " Fast autocomplete
  Plug 'scrooloose/syntastic'                                     " Syntax Checker
endif
Plug 'Shougo/context_filetype.vim'                                " Context filetype feature (suggested for deoplete)
Plug 'Shougo/neoinclude.vim'                                      " completion results from included files

" Looks
Plug 'flazz/vim-colorschemes'                                     " Vim Colorschemes
Plug 'bronson/vim-trailing-whitespace'                            " Show Trailing Spaces
Plug 'ryanoasis/vim-devicons'


call plug#end()                                                   " required

" Install Plugins if they are not installed
if vim_plug_installed== 0
  echo "Installing Plugins, please ignore key map error messages"
  echo ""
  :PlugInstall
endif
