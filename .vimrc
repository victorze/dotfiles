scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General fuzzy finder
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'cseelus/vim-colors-lucid'
call plug#end()


" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
"set title
set mouse=a
set noshowmode

set colorcolumn=80  " Set & show limit column
set scrolloff=3     " Display at least 3 lines around you cursor

" ## Lines
set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers

" ## Indentation
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" ## Theme & Colorscheme
set termguicolors  " Active true colors on terminal
set background=dark
colorscheme lucid

" ## Buffers
set hidden  " Allow change buffers without saving

" Mark trailing spaces.
if &t_Co >= 2 || has("gui_running")
    " Fancy highlighting for space groups.
    highlight ExtraWhitespace ctermbg=red guibg=lightblue
    match ExtraWhitespace /\s\+$/
else
    " Fallback trailing system.
    set listchars=trail:~
    set list
endif

" Disable aditional files.
set noswapfile      " disable swapfiles
set nobackup        " disable backup files (use git)
set encoding=utf-8  " windows needs to be reminded about utf-8
set backspace=indent,eol,start " backspace will always work on insert mode


" --------------------------------------------
" Mappings
" --------------------------------------------

" Map <leader> to space and <localleader> to comma
let g:mapleader = ' '
let g:maplocalleader = ','

" Edit .vimrc
nnoremap <leader>e :e $MYVIMRC<CR>

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Cut to clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Search files fzf
nnoremap <leader>f :Files<CR>

" Exit terminal mode with escape
tnoremap <esc> <C-\><C-n>

" Close buffer
nnoremap <leader>w :bd<CR>

" Save file
nnoremap <leader>s :w<CR>

" Make window navigation less painful
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Run current file
nnoremap <leader>rp :!python3 %:t<CR>
nnoremap <leader>rh :!php %:t<CR>
nnoremap <leader>rn :!node %:t<CR>
nnoremap <leader>rc :!gcc % && ./a.out<CR>
nnoremap <leader>rl :!g++ % && ./a.out<CR>
nnoremap <leader>rb :!bash %:t<CR>
nnoremap <leader>ra :!nasm -felf64 % -o a.o && ld -o a a.o && ./a<CR>

" Current word to uppercase
:imap <c-u> <esc>viwUi
:nmap <c-u> viwU<esc>

" Cursor end line
:imap <c-l> <esc>$a

" Copy current word
:nmap <c-y> viwy<esc>


" --------------------------------------------
" # Plugins Settings
" --------------------------------------------

" ## NerdTree
" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$',
    \ 'node_modules', '\.git'
    \]

let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>


" ## vim-closetag
let g:closetag_filenames = "*.html,*.html.erb,*.xml, *.blade.php"


" ## Airline
" Mappings to change buffer
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

let g:mta_filetypes = {
    \ 'php' : 1,
    \}
