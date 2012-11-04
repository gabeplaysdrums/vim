set nocompatible

" tab indent settings
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set autoindent

" php editing
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

syntax on

" color scheme
color murphy

" font settings
set guifont=Consolas:h12

" switch to 4-space tabs for Grant :)
command HappyGrant set tabstop=4 softtabstop=4 expandtab
