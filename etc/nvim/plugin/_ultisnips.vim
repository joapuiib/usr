" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"######################### SNIPPETS ###################################
let g:expansion_active = 0
let g:ulti_jump_backwards_res = 0
let g:ulti_jump_forwards_res = 0
let g:ulti_expand_res = 0
let g:ulti_expand_or_jump_res = 0

fu! Expand_or_jump(forward)
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return a:forward ? "\<C-N>" : "\<C-P>"
        else
            if g:expansion_active
                if a:forward
                    call UltiSnips#JumpForwards()
                    if g:ulti_jump_forwards_res == 0
                        return "\<Tab>"
                    endif
                else
                    call UltiSnips#JumpBackwards()
                endif
            else
                if a:forward
                    return "\<Tab>"
                endif
            endif
        endif
    endif
    return ''
endfu

" let g:UltiSnipsExpandTrigger=""
" let g:UltiSnipsJumpForwardTrigger=""
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
inoremap <silent> <buffer> <TAB> <C-R>=Expand_or_jump(1)<CR>
inoremap <silent> <buffer> <S-TAB> <C-R>=Expand_or_jump(0)<CR>
snoremap <silent> <buffer> <TAB> <Esc>:call Expand_or_jump(1)<CR>
snoremap <silent> <buffer> <S-TAB> <Esc>:call Expand_or_jump(0)<CR>
