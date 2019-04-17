scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-pug'

Plug 'cseelus/vim-colors-lucid'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'sjl/badwolf'
Plug 'victorze/foo'
Plug 'cormacrelf/vim-colors-github'
Plug 'cocopon/iceberg.vim'
Plug 'rakr/vim-one'
call plug#end()


" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
set notitle
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
autocmd Filetype pug setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab

" ## Theme & Colorscheme
set termguicolors  " Active true colors on terminal
"let g:gruvbox_contrast_dark = "hard"
set background=dark
colorscheme one

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

" Search
set ignorecase


" --------------------------------------------
" Mappings
" --------------------------------------------

" Map <leader> to space and <localleader> to comma
let g:mapleader = ' '
let g:maplocalleader = ','

" Edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>es :source $MYVIMRC<CR>

" You can see all the groups - Highlight
nnoremap <leader>g :so $VIMRUNTIME/syntax/hitest.vim<CR>

" Copy the full path of current buffer to clipboard
nnoremap <localleader>fp :let @+=expand('%:p')<CR>

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Cut to clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

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

" Run app
nnoremap <leader>rp :!python3 %:t<CR>
nnoremap <leader>tp :!python3 -m unittest<CR>
nnoremap <leader>rh :!php %:t<CR>
nnoremap <leader>rn :!node %:t<CR>
nnoremap <leader>rc :!gcc % && ./a.out<CR>
nnoremap <leader>rl :!g++ % && ./a.out<CR>
nnoremap <leader>rb :!bash %:t<CR>
nnoremap <leader>ra :!nasm -felf64 % -o a.o && ld -o a a.o && ./a<CR>
nnoremap <leader>rj :!javac %:t && java %:t:r<CR>
nnoremap <leader>rr :!cargo run<CR>
nnoremap <leader>rk :!cargo check<CR>

" Current word to uppercase
inoremap <c-u> <esc>viwU<esc>A
nnoremap <c-u> viwU<esc>

" Select content document
nnoremap <leader>a ggvG$

" beginning of the current line
nnoremap H 0

" end of the current line
nnoremap L $

" Tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<

" Expand window
nnoremap <leader>e <c-w>100+

" Top cursor on screen
nnoremap <localleader>g zz15<c-e>

" --------------------------------------------
" # Plugins Settings
" --------------------------------------------

" ## NerdTree
" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$',
    \ '\.git$'
    \]

let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1

nnoremap <leader>n :NERDTreeToggle<CR>

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

let g:airline_theme='one'
"let g:airline_theme='distinguished'

" ## ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*,*/venv/*

" win32 gvim
if has("gui_win32")
    set guifont=Consolas:h10:cANSI
    set guioptions-=m  " hide the menu bar
    set guioptions-=T  " hide the menu tools
    set guioptions-=r  " hide the bar scroll
    set guioptions-=L  " hide the bar scroll
    "set linespace=10
    set columns=80
    set lines=17
    noremap <s-z> <esc>
    set wildignore+=*\\vendor\\*,*\\node_modules\\*,*.swp,*.zip,*.exe,*\\venv\\*
endif
