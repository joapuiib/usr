" Txtfmt configuration
" #######################################################################
let g:txtfmtMapwarn = 'c'   " Prevent warnings
let g:txtfmtBgcolormask = "11111111"
let g:txtfmtColor{1} = '^o\\%[range]$,c:#d09a70'
let g:txtfmtColor{2} = '^b\\%[lue]$,c:#5e81ac'
let g:txtfmtColor{3} = '^g\\%[reen]$,c:#a3be8c'
let g:txtfmtColor{4} = '^t\\%[urquoise]$,c:#88c0d0'
let g:txtfmtColor{5} = '^r\\%[ed]$,c:#bf616a'
let g:txtfmtColor{6} = '^v\\%[iolet]$,c:#b48ead'
let g:txtfmtColor{7} = '^y\\%[ellow]$,c:#ebcb8b'
let g:txtfmtColor{8} = '^w\\%[hite]$,c:#FFFFFF'
au! filetypedetect BufRead,BufNewFile *.txt,.comments setfiletype txtfmt
