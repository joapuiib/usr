" https://gist.github.com/miguelgrinberg/527bb5a400791f89b3c4da4bd61222e4
" plugins
let need_to_install_plugins = 0
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    let need_to_install_plugins = 1
endif

call plug#begin('~/.config/nvim/bundle')
    " Sensible defaults
    Plug 'tpope/vim-sensible'

    " File browser with git indicators
    Plug 'preservim/nerdtree'
    " Plug 'vim-scripts/The-NERD-tree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " Tabs
    Plug 'jistr/vim-nerdtree-tabs'

    " git indicator in editor
    Plug 'airblade/vim-gitgutter'

    " Status bar
    Plug 'itchyny/lightline.vim'

    " Telescope file finder / picker
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Text formatting and colors for .txt files
    Plug 'bpstahlman/txtfmt'

    " Markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    " Nord theme
    Plug 'arcticicestudio/nord-vim'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'deathlyfrantic/deoplete-spell'
    Plug 'tpope/vim-surround'
    Plug 'pangloss/vim-javascript' " JavaScript syntax
    Plug 'vim-python/python-syntax' " Python syntax
    Plug 'dense-analysis/ale' " Syntax checker
    Plug 'SirVer/ultisnips' " Snippets engine
    Plug 'honza/vim-snippets' " Snippets
    Plug 'ervandew/supertab'
    " Plug 'Shougo/neosnippet.vim' " Snippets engine
    " Plug 'Shougo/neosnippet-snippets' " Snippets
call plug#end()

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'


" NeoVim config
" #######################################################################

" enable 256 colors
set t_Co=256
set t_ut=

" always show the status bar
set laststatus=2

syntax on
set termguicolors
colorscheme nord
filetype on
filetype indent plugin on
" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'nord' }

set autoindent autowrite showmatch wrapmargin=0 report=1
set showmode nowrap ru
set tabstop=4 sw=4 
set expandtab
" set background=dark
set scrolloff=10
set encoding=UTF-8

set nohlsearch

" turn on line numbering
set number

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

noremap H 0
noremap L $
map ; @@

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Macros
" Copy/paste from clipboard
let @y='"+y'
let @p='"+p'

" indent/unindent with tab/shift-tab
" nmap <Tab> >>
" imap <S-Tab> <Esc><<i
" nmap <S-tab> <<

" Enable folding
" set foldmethod=indent
" set foldlevel=30
" Enable folding with the spacebar
" nnoremap <space> za

" Leader
let mapleader = "\\"
let maplocalleader = ","
nnoremap <leader>ev :vsplit $HOME/usr/etc/nvim/init.vim <cr>
nnoremap <leader>iv ! bash $HOME/usr/etc/nvim/install.sh >/dev/null <cr> 
nnoremap <leader>sv :source $HOME/.config/nvim/init.vim <cr>

" Tab movement
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Spell syntax
" Per incloure el punt volat
set iskeyword+=·
set spelllang=ca,en
" set spell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
" Dont spell urls
syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell
nnoremap <leader>s :setlocal spell!<cr>

" Terminal starts in insert mode
autocmd TermOpen term://* startinsert

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

"######################### ALE ###################################
nmap <F8> <Plug>(ale_fix)
let g:ale_use_global_executables = 1
let b:ale_linters = {'python': ['flake8']}
let b:ale_fixers = {'python': ['autopep8']}
