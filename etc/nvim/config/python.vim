" Python functions
" #######################################################################
"
" From https://vi.stackexchange.com/questions/15431/how-can-i-make-the-neovim-terminal-run-the-current-file-in-python
" Create a function to open a neovim terminal in a small split window and run python 
function! Termpy()
  exec winheight(0)/4."split" | terminal python3 %
endfunction

" Press CTRL+R to run python script into separate term window 
autocmd FileType python nnoremap <buffer> <F5> :call Termpy() <CR>

let g:ale_python_flake8_options="--ignore=E501,E241"
