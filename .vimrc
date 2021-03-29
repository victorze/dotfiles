scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'

Plug 'victorze/foo'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep'  }
Plug 'whatyouhide/vim-gotham'
Plug 'cocopon/iceberg.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nanotech/jellybeans.vim'
call plug#end()


" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
set mouse=a
set colorcolumn=80
set scrolloff=3         " Display at least 3 lines around you cursor

" ## Lines
" set nowrap
set number
set relativenumber

" ## Indentation
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
autocmd Filetype c setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype php setlocal ts=4 sw=4 sts=4 expandtab
autocmd FileType gitcommit setlocal colorcolumn=72 tw=72

" ## Theme & Colorscheme
syntax enable
set termguicolors
let g:gruvbox_contrast_dark = "hard"
set background=dark
colorscheme hyper
let g:airline_theme='distinguished'
" hi LineNR guibg=#1e1c31

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
nnoremap <leader>ls :source $MYVIMRC<CR>

" You can see all the groups - Highlight
nnoremap <leader>h :so $VIMRUNTIME/syntax/hitest.vim<CR>

"Do not use arrows 😤
nnoremap <Up> :echo "Do not use arrows 🤬"<cr>
nnoremap <Down> :echo "Do not use arrows 😤"<cr>
nnoremap <Left> :echo "Do not use arrows 😡"<cr>
nnoremap <Right> :echo "Do not use arrows 😠"<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

" Save file.
nnoremap <leader>s :w<CR>

" Save all files
nnoremap <localleader>s :wa<CR>

" Format file
nnoremap <leader>f ggvG$=

" Format code block
noremap <localleader>f vi{=

" Select content document
nnoremap <leader>a ggvG$

" Top cursor on screen
nnoremap <localleader>g zz25<c-e>

" Current word to uppercase
inoremap <c-u> <esc>viwU<esc>Ea
nnoremap <c-u> viwU<esc>

" Add a semicolon to end of line
inoremap <c-l> <esc>A;
inoremap <c-k> <esc>A

" Run file
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
    nnoremap <leader>rn :!node %:p<CR>
    nnoremap <leader>rp :!python %:p<CR>
    nnoremap <leader>rh :!php %:p<CR>
endif


" --------------------------------------------
" # Plugins Settings
" --------------------------------------------

" ## NerdTree
" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$',
    \ '\.git$', 'venv$', '.venv$'
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
let g:ctrlp_show_hidden = 1


" ## Airline
" Mappings to change buffer
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

let g:mta_filetypes = {
    \ 'php' : 1,
    \}
