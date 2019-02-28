scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General fuzzy finder
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'mattn/emmet-vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'sjl/badwolf'
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
"set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers

" ## Indentation
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" ## Theme & Colorscheme
set termguicolors  " Active true colors on terminal
let g:gruvbox_contrast_dark = 'hard'
set background=dark
let ayucolor="dark"
colorscheme badwolf

" ## Buffers
set hidden  " Allow change buffers without saving

" Mark trailing spaces.
if &t_Co >= 2 || has("gui_running")
    " Fancy highlighting for space groups.
    highlight ExtraWhitespace ctermbg=red guibg=gray
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

" Disable beep sound
set belloff=all

" --------------------------------------------
" Mappings
" --------------------------------------------

" Map <leader> to space and <localleader> to comma
let g:mapleader = ' '
let g:maplocalleader = ','

" Edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>es :source $MYVIMRC<CR>

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

" Open terminal
nnoremap <leader>ot :bel term<CR>

" Exit terminal mode with escape
tnoremap <esc> <C-\><C-n>

" Close buffer
nnoremap <leader>w :bd<CR>

" Save file
nnoremap <leader>s :w<CR>

" Make window navigation less painful
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Run current file
nnoremap <leader>rp :!python3 %:t<CR>
nnoremap <leader>rh :!php %:t<CR>
nnoremap <leader>rn :!node %:t<CR>
nnoremap <leader>rc :!gcc % && ./a.out<CR>
nnoremap <leader>rl :!g++ % && ./a.out<CR>
nnoremap <leader>rb :!bash %:t<CR>
nnoremap <leader>ra :!nasm -felf64 % -o a.o && ld -o a a.o && ./a<CR>
nnoremap <leader>rj :!javac %:t && java %:t:r<CR>
nnoremap <leader>rd :!dotnet run<CR>
nnoremap <leader>tp :!python3 -m unittest<CR>

" Mode normal
inoremap jk <esc>
inoremap <esc> <nop>

" Current word to uppercase
inoremap <c-u> <esc>viwU<esc>A
nnoremap <c-u> viwU<esc>

" Cursor end of the current line
inoremap <c-l> <esc>A

" Copy current word
nnoremap <localleader>y viwy<esc>

" Select content document
nnoremap <leader>a ggvG$

" Next line
inoremap <c-o> <esc>o

" beginning of the current line
nnoremap H 0

" end of the current line
nnoremap L $

" ## code snippets
" java
iabbrev sso System.out.print

" c#
iabbrev ccw Console.WriteLine
iabbrev ccr Console.ReadLine();

" --------------------------------------------
" # Plugins Settings
" --------------------------------------------

" ## NerdTree
" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$',
    \ 'node_modules', '\.git$'
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

let g:airline_theme='distinguished'
