set nocompatible

" tab indent settings
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent

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

" color scheme and syntax highlighting
color murphy
syntax on

" font settings
set guifont=Consolas:h12

" filetype detection
if has("autocmd")
  augroup phpfiles
    autocmd BufRead,BufNewFile *.php,*.module,*.theme,*.inc,*.install,*.info,*.engine,*.profile,*.test set filetype=php
  augroup END

  augroup pythonfiles
    au FileType python set tabstop=2 shiftwidth=2 softtabstop=2
  augroup end
endif
