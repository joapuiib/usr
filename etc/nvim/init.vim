" https://gist.github.com/miguelgrinberg/527bb5a400791f89b3c4da4bd61222e4
" plugins

" let &runtimepath=escape("~/usr/etc/nvim/", '\,') . "," . &runtimepath
let &runtimepath.=','.escape("~/usr/etc/nvim/", '\,')
let &runtimepath.=','.escape("~/usr/etc/nvim/after/", '\,')

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

    " Telescope file finder / picker Plug 'nvim-lua/popup.nvim' Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Text formatting and colors for .txt files
    Plug 'bpstahlman/txtfmt'

    " Nord theme
    Plug 'arcticicestudio/nord-vim'
    Plug 'ap/vim-css-color' " CSS colors

    " TAB suggestions
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'zchee/deoplete-jedi'
    " Plug 'deathlyfrantic/deoplete-spell'
    Plug 'tpope/vim-surround'

    " Run tests
    Plug 'vim-test/vim-test'

    Plug 'pangloss/vim-javascript' " JavaScript syntax
    Plug 'vim-python/python-syntax' " Python syntax
    Plug 'preservim/vim-markdown' " Markdown syntax
    Plug 'ekalinin/Dockerfile.vim' " Dockerfile syntax
    Plug 'stanangeloff/php.vim' " PHP syntax
    " Plug 'vim-ruby/vim-ruby' " Ruby utilities
    Plug 'dense-analysis/ale' " Syntax checker

    Plug 'SirVer/ultisnips' " Snippets engine
    Plug 'honza/vim-snippets' " Snippets
    Plug 'ervandew/supertab'
    " Plug 'Shougo/neosnippet.vim' " Snippets engine
    " Plug 'Shougo/neosnippet-snippets' " Snippets
    
    " Yaml folding
    Plug 'pedrohdz/vim-yaml-folds'

    " Mysql integration
    Plug 'vim-scripts/dbext.vim'
    " Plug 'tpope/vim-dadbod'

    " Live Server
    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

    " Copilot
    Plug 'github/copilot.vim'
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

" Disable bell
set visualbell
set t_vb=

" enable 256 colors
set t_Co=256
set t_ut=

" always show the status bar
set laststatus=2

syntax on
set termguicolors
colorscheme nord
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Set so txtfmt works

filetype on
filetype indent plugin on
" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'nord' }

set autoindent autowrite showmatch wrapmargin=0 report=1
set showmode nowrap ru
set tabstop=4 sw=4 
autocmd FileType javascript,html,css,xml,json,php setlocal shiftwidth=2 softtabstop=2

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

"testing mappings
let test#strategy = "neovim"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Macros
" Copy/paste from clipboard
let @y='"+y'
let @p='"+p'
" set clipboard^=unnamed,unnamedplus

" indent/unindent with tab/shift-tab
" nmap <Tab> >>
" imap <S-Tab> <Esc><<i
" nmap <S-tab> <<

" Enable folding
set foldmethod=syntax
set foldlevel=10
" Enable folding with the spacebar
nnoremap <space> za
nnoremap <C-O> zR
nnoremap <C-P> zM
" set nofoldenable

" Leader
let mapleader = "\\"
let maplocalleader = ","
nnoremap <leader>ev :vsplit $HOME/usr/etc/nvim/init.vim <cr>
nnoremap <leader>sv :source $MYVIMRC<CR>

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


"######################### NERDTREE ###################################
" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>t :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

let NERDTreeShowHidden=1
" NERDTree setting defaults to work around http://github.com/scrooloose/nerdtree/issues/489
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"

set splitbelow
set splitright
let g:NERDTreeMapActivateNode='<space>'
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeMapPreviewSplit='gv'


"######################### ALE ###################################
nmap <F8> <Plug>(ale_fix)
let g:ale_use_global_executables = 1
let b:ale_linters = {'python': ['flake8']}
let b:ale_fixers = {'python': ['autopep8']}


"######################### DEOPLETE ###################################
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically

set completeopt-=preview

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


"######################### DEVICONS ###################################
" Serveix tant per extensions com per tipus de fitxers
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['eruby'] = ''


"######################### LIGHTLINE ###################################
let g:lightline = {
    \ 'component_function': {
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
    \ },
    \ }
" 'separator': { 'left': '', 'right': '' },
" 'subseparator': { 'left': '', 'right': '' }

function! MyFiletype()
return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction


"######################### TELESCOPE ###################################
" gfiles shortcut
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-g> <cmd>Telescope git_files<cr>

autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

"######################### DBEXT ###################################
"
let dbhost = trim(system('docker inspect --format "{{ .NetworkSettings.IPAddress }}" mariadb'))
if v:shell_error != 0
    let dbhost="@askg"
endif
let g:dbext_default_profile_usual = 'type=MYSQL:user=root:passwd=1234:host=' . dbhost . ':dbname=@askg'
let g:dbext_default_profile = 'usual'
