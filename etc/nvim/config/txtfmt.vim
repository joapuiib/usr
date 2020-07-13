" Txtfmt configuration
" #######################################################################
let g:txtfmtMapwarn = 'c'   " Prevent warnings
let g:txtfmtBgcolormask = "11111111"
let g:txtfmtColor{1} = '^o\\%[range]$,c:214,g:#FFA500'
let g:txtfmtColor{7} = '^y\\%[ellow]$,c:Yellow,g:#FFFF00'
au! filetypedetect BufRead,BufNewFile *.txt,.comments setfiletype txtfmt
