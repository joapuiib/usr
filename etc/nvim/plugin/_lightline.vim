  let g:lightline = {
        \ 'component_function': {
        \   'filetype': 'MyFiletype',
        \   'fileformat': 'MyFileformat',
        \ },
        \ }
" 'separator': { 'left': '', 'right': '' },
" 'subseparator': { 'left': '', 'right': '' }
  
  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction
  
  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction
