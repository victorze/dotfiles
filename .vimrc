scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'neoclide/vim-jsx-improve'
Plug 'jwalton512/vim-blade'
Plug 'digitaltoad/vim-pug'

Plug 'victorze/foo'
call plug#end()


" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
set mouse=a
set colorcolumn=80
set scrolloff=3         " Display at least 3 lines around you cursor

" ## Lines
set nowrap
set number
set relativenumber

" ## Indentation
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab
autocmd FileType gitcommit setlocal colorcolumn=72 tw=72

" ## Theme & Colorscheme
syntax enable
set termguicolors
let g:gruvbox_contrast_dark = "hard"
set background=dark
colorscheme hyper
let g:airline_theme='distinguished'
"let g:airline_theme = 'codedark'

" ## Buffers
set hidden  " Allow change buffers without saving

" Mark trailing spaces.
highlight ExtraWhitespace ctermbg=gray guibg=gray
match ExtraWhitespace /\s\+$/

" Disable aditional files.
set noswapfile      " disable swapfiles
set nobackup        " disable backup files (use git)
set encoding=utf-8  " windows needs to be reminded about utf-8

" Search
set ignorecase
set hlsearch
set incsearch

" Jump between matching HTML/XML tags
runtime macros/matchit.vim


" --------------------------------------------
" Mappings
" --------------------------------------------

" Map <leader> to space and <localleader> to comma
let g:mapleader = ' '
let g:maplocalleader = ','

" Edit .vimrc
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>es :source $MYVIMRC<CR>

" You can see all the groups - Highlight
nnoremap <leader>h :so $VIMRUNTIME/syntax/hitest.vim<CR>

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Cut to clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Close buffer
nnoremap <leader>w :bd<CR>

" Close all buffers
nnoremap <localleader>w :bufdo bd<CR>

" Save file
nnoremap <leader>s :w<CR>

" Save all files
nnoremap <localleader>s :wa<CR>

" Select content document
nnoremap <leader>a ggvG$

" Format code block
noremap <localleader>f vi{=

" Top cursor on screen
nnoremap <localleader>g zz15<c-e>

" Current word to uppercase
inoremap <c-u> <esc>viwU<esc>Ea
nnoremap <c-u> viwU<esc>

" Add a semicolon to end of line
inoremap <c-l> <esc>A;<esc>
nnoremap <c-l> A;<esc>

" Go end/start line
nnoremap H 0
vnoremap H 0
nnoremap L $
vnoremap L $

" Insert mode to normal mode
inoremap jk <esc>

" Disabling the old keys
inoremap <esc> <nop>

" Run file
nnoremap <leader>rp :!clear && python3 %:p<CR>
nnoremap <leader>rn :!clear && node %:p<CR>


" --------------------------------------------
" # GVIM setting (Windows 10)
" --------------------------------------------

if has("gui_win32")
    set notitle
    set guifont=Consolas:h10cANSI
    set guioptions-=m  " hide the menu bar
    set guioptions-=T  " hide the menu tools
    set guioptions-=r  " hide the bar scroll
    set guioptions-=L  " hide the bar scroll
    set columns=90
    set lines=25
    noremap <s-z> <esc>
    set guicursor+=a:blinkon0
    set backspace=indent,eol,start " backspace will always work on insert mode

    " Disable beep sound
    set belloff=all

    " Run file
    nnoremap <leader>rp :!python %:p<CR>
    nnoremap <leader>rn :!node %:p<CR>
    nnoremap <leader>rh :!php %:p<CR>
endif


" --------------------------------------------
" # Plugins Settings
" --------------------------------------------

" ## NerdTree
" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$',
    \ '\.git$', 'node_modules$', 'vendor$','venv$', '.venv$',
    \ '.idea$', '.mvn$', 'target$', '.settings$', '.classpath$', '.project$', '.factorypath', '.iml$'
    \]

let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1

nnoremap <leader>n :NERDTreeToggle<CR>


" ## ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|.idea$\|.mvn$\|vendor$\|node_modules$\|venv$\|.venv$\|build$\|target$',
    \ 'file': '\.so$\|\.dat$|\.DS_Store$'
    \ }


" ## Airline
" Mappings to change buffer
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

let g:mta_filetypes = {
    \ 'php' : 1,
    \}

" ## Vim Fugitive
nnoremap <leader>g :G
