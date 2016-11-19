if has('nvim')

  " Airline Settings
  let g:airline_powerline_fonts  = 1
  "let g:airline_theme="harlequin"
  let g:airline#extensions#tabline#enabled = 1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''


  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  " Deoplete uses all possible sources
  if !exists('g:deoplete#sources')
    let g:deoplete#sources = {}
  endif
  let g:deoplete#sources._ = []
  let g:deoplete#sources.html = ['buffer']

  " Summon deoplete autocomplete except when there is no input yet
  function! s:handle_tab()
    let line=getline('.')[:getcurpos()[2] - 2]
    if match(line, '\s*$') == 0
      return "\<Tab>"
    else
      return deoplete#mappings#manual_complete()
    endif
  endfunction
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :<sid>handle_tab()

  " smart close popup
  inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

  " special summons to omnifunc for certain filetypes
  if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = { 'mkd': ['<', '<[^>]*\s[[:alnum:]-]*'],
                                   \ 'xhtml': ['<', '<[^>]*\s[[:alnum:]-]*'],
                                   \ 'html': ['<', '<[^>]*\s[[:alnum:]-]*'],
                                   \ 'markdown': ['<', '<[^>]*\s[[:alnum:]-]*'],
                                   \ 'xml': ['<', '<[^>]*\s[[:alnum:]-]*'],}
  endif
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {'sass': ['\w+', '\w+[):;]?\s+\w*', '[@!]'],
                                        \ 'scss': ['\w+', '\w+[):;]?\s+\w*', '[@!]'],
                                        \ 'lua': ['\w+[.:]', 'require\s*\(?["'']\w*'],
                                        \ 'java': ['[^. \t0-9]\.\w*'],
                                        \ 'ruby': ['[^. \t0-9]\.\w*', '[a-zA-Z_]\w*::\w*'],
                                        \ 'css': ['\w+', '\w+[):;]?\s+\w*', '[@!]'],}
  endif
  let g:deoplete#omni#input_patterns.tex =
        \ '\v\\%('
        \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|%(include%(only)?|input)\s*\{[^}]*'
        \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . ')'
  " Refresh menu always
  let g:deoplete#enable_refresh_always = 0


  " Settings for echodoc
  set noshowmode
  set cmdheight=2
  let g:echodoc_enable_at_startup = 1


  " Settings for deoplete-clang
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
  let g:deoplete#sources#clang#sort_algo = 'priority'


  " Settings for deoplete-jedi
  let g:deoplete#sources#jedi#show_docstring = 1

  " Settings for deoplete with vim-multiple-cursors
  function g:Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
  endfunction
  function g:Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
  endfunction

  " Remove preview window
  set completeopt=menu
  set completeopt+=menuone
  autocmd! CompleteDone * pclose!


  " Settings for neomake
  autocmd! BufWritePost * Neomake
  nnoremap <leader>q :EnType<CR>
  let g:neomake_verbose=0
  let g:neomake_error_sign = {'text': 'x', 'texthl': 'ErrorMsg', }
  let g:neomake_error_sign = {'text': '?', 'texthl': 'WarningMsg', }
  let g:neomake_python_enabled_makers = ['pylint']

else
  " Use neocomplete
  let g:neocomplete#enable_at_startup = 1
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.tex =
        \ '\v\\%('
        \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|%(include%(only)?|input)\s*\{[^}]*'
        \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . ')'
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [], "passive_filetypes": ["scala"] }
endif

" Ultisnips expansion trigger
let g:UltiSnipsExpandTrigger="<S-Tab>"

" Use universal ctags
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
let g:tagbar_autoclose = 1

" Indent Guide
let g:day_start = 8
let g:day_end = 20
if strftime("%H") >= g:day_start && strftime("%H") < g:day_end
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=grey
else
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
endif
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1


" Focus
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Diary filetype pandoc
let g:calendar_filetype = 'pandoc'
let g:previm_open_cmd = 'firefox-developer'
let g:previm_open_cmd = 'firefox-developer'
let g:instant_pandoc_port = '8090'
