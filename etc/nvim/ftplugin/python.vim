" Python functions
" #######################################################################
"
" From https://vi.stackexchange.com/questions/15431/how-can-i-make-the-neovim-terminal-run-the-current-file-in-python
" Create a function to open a neovim terminal in a small split window and run python 
function! Termpy()
  exec winheight(0)/4."split" | terminal python3 -i %
endfunction

" Press F5 to run python script into separate term window 
nnoremap <buffer> <F5> :w <bar> :call Termpy() <CR>
let g:ale_python_flake8_options="--ignore=E501,E241"

let g:python_highlight_all = 1

set foldmethod=indent
