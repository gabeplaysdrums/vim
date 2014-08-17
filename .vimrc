set nocompatible

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
if hostname() == "DACTYL2"
  set guifont=Consolas:h11.5
elseif hostname() == "gabriels-mbp"
  set guifont=Menlo:h14
else
  set guifont=Consolas:h12
endif

" tab settings
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" indent settings
set autoindent nocindent nosmartindent indentexpr=

" filetype detection
if has("autocmd")
  au BufRead,BufNewFile *.php,*.module,*.theme,*.inc,*.install,*.info,*.engine,*.profile,*.test set filetype=php

  au BufRead,BufNewFile *.gitignore set filetype=conf

  au Filetype html set indentexpr= tabstop=2 shiftwidth=2 softtabstop=2
endif
