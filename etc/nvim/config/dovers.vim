" Dovers Grade functions
" #######################################################################
let g:base1 = 4
let g:base2 = 5

map <F1> :<C-U>call Score(v:count1, 1)<cr>
map <F2> :<C-U>call Score(v:count1, 2)<cr>
map <F3> :<C-U>call Score(v:count1, g:base1)<cr>
map <F4> :<C-U>call Score(v:count1, g:base2)<cr>
map <F5> :<C-U>call Score(0,1)<cr>

map <F10> :CommentHistory
let @c='o```text```k'

function Score(mult, div)
    try | exe "norm 0" | endtry
    try 
        exe "norm /%\/llv/)hy?%" 
    catch
        echo "% not found"
        return 0
    endtry
    exe "norm i=\" *".a:mult.".0/".a:div.".0"
    exe "norm lx"
endfunction
