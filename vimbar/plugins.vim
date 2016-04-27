"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle                                                                                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Setting up Vundle - the vim plugin bundler
let vim_plug_installed=1
let plug_vim='~/.vim/autoload/plug.vim'
" If vim-plug file is absent, install vim-plug
"if !filereadable(plug_vim)
"  echo "Installing Vim-Plug.."
"  echo ""
"  silent call mkdir('~/.vim/autoload', "p")
"  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
"  let vim_plug_installed=0
"endif


call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'        " Good Commenting
Plug 'scrooloose/nerdtree'             " File Browsing
Plug 'yashsriv/vim-airline-harlequin'  " My own colorscheme for airline
Plug 'vim-airline/vim-airline'         " Powerful statusline
Plug 'Lokaltog/vim-easymotion'         " Easy Motion search
Plug 'majutsushi/tagbar'               " Tagbar ( Display info on structure of code)
Plug 'Yggdroot/indentLine'             " Show indents
Plug 'suan/vim-instant-markdown'       " Display Markdown
Plug 'funorpain/vim-cpplint'           " Cpplint checker
Plug 'flazz/vim-colorschemes'          " Vim Colorschemes
Plug 'godlygeek/tabular'               " Table Settings
Plug 'scrooloose/syntastic'            " Syntax Checker
Plug 'Chiel92/vim-autoformat'          " AutoFormat
"Plug 'ervandew/supertab'               " Autocomplete on Tab
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }         " Autocomplete while typing
Plug 'bronson/vim-trailing-whitespace' " Show Trailing Spaces
Plug 'Shougo/unite.vim'                " Something very powerful(trying to learn)
if has('nvim')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
else
  Plug 'Shougo/neocomplete.vim'
endif
Plug 'Shougo/unite.vim'                " Something very powerful(trying to learn)
Plug 'ap/vim-css-color'                " Colored css
"Plug 'LaTeX-Box-Team/LaTeX-Box'       " LaTeX plugin
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'vim-scripts/AutoComplPop'
call plug#end()                          " required

if vim_plug_installed== 0
  echo "Installing Plugins, please ignore key map error messages"
  echo ""
  :PlugInstall
endif

" YCM settings for less irritating behaviour
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_semantic_triggers={'html': ['<', '</'], 'css': [ 're!^\s{4}', 're!:\s+' ]}

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts  = 1
let g:airline_theme="harlequin"
" Use deoplete.
let g:deoplete#enable_at_startup = 0
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :deoplete#mappings#manual_complete()
