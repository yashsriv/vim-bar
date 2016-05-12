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
if exists(':SyntasticInfo')
  set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*

set statusline+=%=
set statusline+=%-14.(%c%V\ ,\ %l/%L%)\ %P

set laststatus=2               " Last window always has a statusline

if has('nvim')
  " Airline
  let g:airline_section_c = airline#section#create(['%t'])
  let options_section_y = ["%{tagbar#currenttag('[%s]','','s')}"]
  let g:airline_section_y = airline#section#create(options_section_y)
endif
