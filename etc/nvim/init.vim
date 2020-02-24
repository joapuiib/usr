"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath
"source ~/.vimrc

" Install plugins
call plug#begin('~/.config/nvim/bundle')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'deathlyfrantic/deoplete-spell'
    Plug 'bpstahlman/txtfmt'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()
let g:deoplete#enable_at_startup = 1


" NeoVim config
" #######################################################################

syntax on

set autoindent autowrite showmatch wrapmargin=0 report=1
set showmode nowrap ru
set tabstop=4 sw=4 
set expandtab
set background=dark
set scrolloff=10

set nohlsearch

filetype indent plugin on

set iskeyword+=:

inoremap jk <ESC>
map ; @@

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Macros
let @y='"+y'
let @p='"+p'

" Enable folding
set foldmethod=indent
set foldlevel=30

" Enable folding with the spacebar
nnoremap <space> za


" Dovers Grade functions
" #######################################################################
let @h=':try | exe "norm k" | endtry/%/\/llv/)hy/%N'
let @j='Plxh'
map <F1> @h@j
map <F2> @h:new<CR>A<C-r>=<C-r>"*3.0/4.0<CR><ESC>0v/.<CR>lly:q!<CR>@j
map <F3> @h:new<CR>A<C-r>=<C-r>"/2.0<CR><ESC>0v/.<CR>lly:q!<CR>@j
map <F4> @h:new<CR>A<C-r>=<C-r>"/4.0<CR><ESC>0v/.<CR>lly:q!<CR>@j
map <F5> @hr0

map <F10> :CommentHistory
let @c='o```text```k'


" Txtfmt configuration
" #######################################################################
let g:txtfmtMapwarn = 'c'   " Prevent warnings
let g:txtfmtBgcolormask = "11111111"
let g:txtfmtColor{1} = '^o\\%[range]$,c:214,g:#FFA500'
let g:txtfmtColor{7} = '^y\\%[ellow]$,c:Yellow,g:#FFFF00'
au! filetypedetect BufRead,BufNewFile *.txt,.comments setfiletype txtfmt
let maplocalleader=','


" Deoplete configuration
" #######################################################################
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically

set completeopt-=preview

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Python functions
" #######################################################################
" From https://vi.stackexchange.com/questions/15431/how-can-i-make-the-neovim-terminal-run-the-current-file-in-python
" Create a function to open a neovim terminal in a small split window and run python 
function! Termpy()
  exec winheight(0)/4."split" | terminal python3 %
endfunction

" Press CTRL+R to run python script into separate term window 
autocmd FileType python nnoremap <buffer> <F5> :call Termpy() <CR>

"######################### LOAD FILES ###################################
source ~/.config/nvim/config/markdown-preview.vim
