"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline Modding                                                                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Normal Status Line for non-airline vim

" Display Filename
set statusline=%<%#identifier#
set statusline+=[%f]
set statusline+=%*

" Display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" Display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%y  " FileType
set statusline+=%h  " Help Tag

" Read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

" Modified flag
set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*

" Syntastic Error messages
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=
set statusline+=%-14.(%c%V\ ,\ %l/%L%)\ %P

set laststatus=2               " Last window always has a statusline

" Airline

let g:airline_section_c = airline#section#create(['%t'])
let options_section_y = []
let g:airline_section_y = airline#section#create(options_section_y)


" Possibly the default config of vim-airline
"let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])
"let g:airline_section_b = airline#section#create(['hunks', 'branch'])
"let g:airline_section_gutter = airline#section#create(['readonly'])
"let options_section_x = ['tagbar', 'filetype']
"if exists('*env#statusline')
"call add(options_section_x, '%{GitBranchInfoString()}')
"endif
"let g:airline_section_x = airline#section#create(options_section_x)
"let g:airline_section_y = airline#section#create(['%{&fenc}', '[%{&ff}]'])
"let g:airline_section_z = airline#section#create(['%P ', g:airline_symbols.linenr, ' %l : %c'])
"let g:airline_section_error = airline#section#create(['ycm_error_count', 'syntastic', 'eclim'])
"let g:airline_section_warning = airline#section#create(['ycm_warning_count', 'whitespace'])
