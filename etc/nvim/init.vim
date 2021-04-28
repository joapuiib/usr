call plug#begin('~/.config/nvim/bundle')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'deathlyfrantic/deoplete-spell'
    Plug 'bpstahlman/txtfmt'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    Plug 'tpope/vim-surround'
    Plug 'pangloss/vim-javascript' " JavaScript syntax
    Plug 'dense-analysis/ale' " Syntax checker
    Plug 'SirVer/ultisnips' " Snippets engine
    Plug 'honza/vim-snippets' " Snippets
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
" set iskeyword+=:

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
nnoremap <leader>ev :vsplit $HOME/usr/etc/nvim/init.vim <cr>
nnoremap <leader>iv ! bash $HOME/usr/etc/nvim/install.sh >/dev/null <cr> 
nnoremap <leader>sv :source $HOME/.config/nvim/init.vim <cr>

" Spell syntax
" Per incloure el punt volat
set iskeyword+=·
set spelllang=ca,en
" set spell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
" Dont spell urls
syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell

" Terminal starts in insert mode
autocmd TermOpen term://* startinsert


"######################### ALE ###################################
nmap <F8> <Plug>(ale_fix)
let g:ale_use_global_executables = 1
let b:ale_linters = {'python': ['flake8']}
let b:ale_fixers = {'python': ['autopep8']}

"######################### SNIPPETS ###################################
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"######################### LOAD FILES ###################################
source ~/.config/nvim/config/deoplete.vim
source ~/.config/nvim/config/dovers.vim
source ~/.config/nvim/config/markdown-preview.vim
source ~/.config/nvim/config/txtfmt.vim
