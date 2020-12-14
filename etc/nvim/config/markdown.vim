" Markdown
" #######################################################################

" blue class wrapper
let @b='i.blue[ea]'

autocmd BufNewFile,BufReadPre *.md.erb let b:eruby_subtype = 'markdown'
