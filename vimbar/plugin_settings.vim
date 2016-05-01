if has('nvim')
  " Airline Settings
  let g:airline_powerline_fonts  = 1
  let g:airline_theme="harlequin"
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
  " Summon deoplete autocomplete
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :deoplete#mappings#manual_complete()
  " smart close popup
  inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
  " special summons to omnifunc for certain filetypes
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.html = '[<[</]]'
  let g:deoplete#omni#input_patterns.css = '[[^\s{4}][:\s+]]'
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
  let g:deoplete#enable_refresh_always = 1
  " Settings for echodoc
  set noshowmode
  set cmdheight=2
  let g:echodoc_enable_at_startup = 1
  " Settings for deoplete-clang
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
  let g:deoplete#sources#clang#sort_algo = 'priority'
  " Settings for deoplete-jedi
  let g:deoplete#sources#jedi#show_docstring = 0
  " Remove preview window
  set completeopt=menu
  set completeopt+=menuone
  augroup completion
    autocmd CompleteDone * pclose!
  augroup END
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
endif

" Ultisnips expansion trigger
let g:UltiSnipsExpandTrigger="<S-Tab>"
