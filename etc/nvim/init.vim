" Install plugins
call plug#begin('~/.config/nvim/bundle')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'deathlyfrantic/deoplete-spell'
    Plug 'bpstahlman/txtfmt'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    Plug 'tpope/vim-surround'
    Plug 'pangloss/vim-javascript' " JavaScript syntax
call plug#end()
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'


" NeoVim config
" #######################################################################

syntax on
filetype indent plugin on

set autoindent autowrite showmatch wrapmargin=0 report=1
set showmode nowrap ru
set tabstop=4 sw=4 
set expandtab
set background=dark
set scrolloff=10

set nohlsearch
set iskeyword+=:

noremap H 0
noremap L $
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
" set foldmethod=indent
" set foldlevel=30
" Enable folding with the spacebar
" nnoremap <space> za

let mapleader = "\\"
let maplocalleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Spell syntax
" Per incloure el punt volat
set iskeyword+=·
set spelllang=ca,en
" set spell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
" Dont parse urls
syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell


"######################### LOAD FILES ###################################
source ~/.config/nvim/config/deoplete.vim
source ~/.config/nvim/config/dovers.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/markdown-preview.vim
source ~/.config/nvim/config/python.vim
source ~/.config/nvim/config/yaml.vim
source ~/.config/nvim/config/txtfmt.vim
source ~/.config/nvim/config/javascript.vim
