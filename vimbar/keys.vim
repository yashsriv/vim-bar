""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Key Mappings                                                                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Leader key is comma. I know a helpful feature is shadowed but I don't use it
"so no problemo
let mapleader=","
" Easy mistake ; instead of :
nnoremap ; :
vnoremap ; :
" Easily Comment out using NERDCommenter
nmap // <leader>c<space>
vmap // <leader>cs
" Commands to properly indent the code
nnoremap ../ mzgg=G`z
inoremap ../ <esc>mzgg=G`za
" ,. is escape in insert mode.
inoremap <leader>. <esc>
" Move lines up(-) or down(_)
noremap - ddp
noremap _ ddkP
" Map space to insert spaces
nnoremap <space> li <esc>h
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Indent Lines
nnoremap <tab> i<tab><esc>
" Remove Highlight
nnoremap <leader><leader>c :noh<cr>
" Directory Movement
nnoremap <leader><leader>d :NERDTreeToggle<CR>
" Tagbar
nnoremap <leader><leader>t :TagbarToggle<CR>
" Window Movement in insert mode
inoremap <C-w> <C-o><C-w>
" Save file as superuser
command! WR :execute ':silent w !sudo tee % > /dev/null' | :edit!
" Next buffer
nnoremap bn :bnext<CR>
" Previous buffer
nnoremap bp :bprev<CR>
" Close buffer
nnoremap bd :call CloseAllSplits()<CR>:bd<CR>
" Window Movement
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
" NeoVim Specific
if has('nvim')
  " Nvim Terminal commands
  nnoremap <leader>t :terminal<CR>
  tnoremap <Esc> <C-\><C-n>
endif
