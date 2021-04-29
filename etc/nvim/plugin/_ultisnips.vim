"######################### SNIPPETS ###################################
let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res > 0
endfunction

"inoremap <TAB>=Ulti_ExpandOrJump() ? "" :
" \ pumvisible() ? "\<C-n>" :
"\ "\<TAB>"
