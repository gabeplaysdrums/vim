set nocompatible
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set autoindent

" set foldmethod=indent 

if has("autocmd")
  augroup phpfiles
    autocmd BufRead,BufNewFile *.php,*.module,*.theme,*.inc,*.install,*.info,*.engine,*.profile,*.test set filetype=php
  augroup END
endif

" tab completion
function! CleverTab()
  if pumvisible()
    return "\<C-N>"
  endif
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-O>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"function! Smart_TabComplete()
"  let line = getline('.')                         " curline
"  let substr = strpart(line, -1, col('.')+1)      " from start to cursor
"  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"  if (strlen(substr)==0)                          " nothing to match on empty string
"    return "\<tab>"
"  endif
"  let has_period = match(substr, '\.') != -1      " position of period, if any
"  let has_slash = match(substr, '\/') != -1       " position of slash, if any
"  if (!has_period && !has_slash)
"    return "\<C-X>\<C-P>"                         " existing text matching
"  elseif ( has_slash )
"    return "\<C-X>\<C-F>"                         " file matching
"  else
"    return "\<C-X>\<C-O>"                         " plugin matching
"  endif
"endfunction
"
"noremap <tab> <c-r>=Smart_TabComplete()<CR>

syntax on

" switch to 4-space tabs for Grant :)
command HappyGrant set tabstop=4 softtabstop=4 expandtab
