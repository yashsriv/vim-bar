"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. Automatic on Startup                                                                                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on                                                 " Filetype detection[on] plugin[on] indent[on]

augroup filetype_specific
  autocmd!
  autocmd filetype svn,*commit*,markdown setlocal spell                                      " Spell Check
  autocmd FileType make setlocal noexpandtab                                        " In Makefiles DO NOT use spaces instead of tabs
  autocmd FileType c setlocal equalprg=/usr/bin/astyle\ -A14s2pHUxG                 " Format code as per google guidelines for c
  autocmd FileType cpp setlocal equalprg=/usr/bin/astyle\ -A14s2pHUxG               " Format code as per google guidelines for cpp
  autocmd FileType arduino setlocal equalprg=/usr/bin/astyle\ -A14s2pHUxG           " Format code as per my guidelines for arduino
  autocmd FileType java setlocal equalprg=/usr/bin/astyle\ -A14s2pHUxG              " Format code as per my guidelines for java
  autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4   " Python Spacing rules
  autocmd FileType html setlocal equalprg=js-beautify\ -s\ 2\ --html                " Format html
  autocmd FileType javascript setlocal equalprg=js-beautify\ -s\ 2                  " Format js
  autocmd FileType css setlocal equalprg=js-beautify\ -s\ 2\ --css                  " Format css
  " Auomatically compile and open tex files on pressing enter
  autocmd FileType tex nnoremap <CR> :w \| let x=system('pdflatex ' . expand('%:r') . '.tex ; evince ' . expand('%:r') . '.pdf &')<CR><CR>
augroup END

augroup startup
  autocmd!
  "jump to last cursor position when opening a file
  autocmd BufReadPost * call SetCursorPosition()
  " Boilerplate C code
  autocmd BufNewFile *.c $r ~/dotfiles/boilerplate/foo.c
  autocmd BufNewFile *.c normal kdd2ji  
  " Boilerplate cxx , i.e., opencv IP code
  autocmd BufNewFile *.cxx $r ~/dotfiles/boilerplate/foo.cxx
  autocmd BufNewFile *.cxx normal kdd6j4l
  " Boilerplate ino code
  autocmd BufNewFile *.ino $r ~/dotfiles/boilerplate/foo.ino
  autocmd BufNewFile *.ino normal kdd2j
augroup END


augroup close
  autocmd!
  " Close vim if nerd tree is the only remaining buffer
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Close all open side splits before deleting a buffer else vim crashes
  autocmd BufWipeout * call CloseAllSplits()
augroup END

function! CloseAllSplits()
  TagbarClose
  NERDTreeClose
endfunction

function! SetCursorPosition()
  "dont do it when writing a commit log entry
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  else
    call cursor(1,1)
  endif
endfunction

set ff=unix
