scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................
call plug#begin('~/.vim/plugged/')
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-pug'

Plug 'cseelus/vim-colors-lucid'
Plug 'NLKNguyen/papercolor-theme'
Plug 'koirand/tokyo-metro.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()

" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
set notitle
set mouse=a
set noshowmode

"set colorcolumn=80  " Set & show limit column
set scrolloff=3  " Display at least 3 lines around you cursor

" ## Lines
set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line

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
colorscheme gruvbox

" Mark trailing spaces.
if &t_Co > 2 || has("gui_running")
    highlight ExtraWhitespace ctermbg=red guibg=gray
    "highlight ExtraWhitespace ctermbg=red guibg=lightblue
    match ExtraWhitespace /\s\+$/
else
    set listchars=trail:~
    set list
endif

" ## Buffers
set hidden  " Allow change buffers without saving

" ## Disable aditional files.
set noswapfile " disable swapfiles (maybe a bad idea? 🤔)
set nobackup " disable backup files (use git)
set encoding=utf-8 " windows needs to be reminded about utf-8
set backspace=indent,eol,start " backspace will always work on insert mode

set fillchars+=vert:\   " Remove unpleasant pipes from vertical splits
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" ## GVIM setting
set guioptions-=m  " hide the menu bar
set guioptions-=T  " hide the menu tools
set guioptions-=r  " hide the bar scroll
set guioptions-=L  " hide the bar scroll
"set linespace=10

"au GUIEnter * simalt ~x " start gVim maximized

" to set the initial window size.
set columns=75
set lines=17

" Disable beep sound
set belloff=all

" --------------------------------------------
" # Mappings
" --------------------------------------------

" ## Map <leader> to space and <localleader> to comma
let g:mapleader = ' '
let g:maplocalleader = ','

" ## Edit _vimrc
nnoremap <leader>ev :e ~\_vimrc<CR>
nnoremap <leader>es :source ~\_vimrc<CR>

" ## Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" ## Cut to clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" ## Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" ## Scroll
nnoremap <up> <c-y>
nnoremap <down> <c-e>

" ## Exit terminal mode with escape
tnoremap <C-q> <C-\><C-n>

" Open terminal
nnoremap <leader>ot :bel term<CR>

" Exit terminal mode with escape
tnoremap <esc> <C-\><C-n>

" # Close buffer
nnoremap <leader>w :bd<CR>

" ## Close all buffers
nnoremap <leader>kw :bufdo bd<CR>

" # Save
nnoremap <leader>s :w<CR>

" ## Make window navigation less painful.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ## Run current script
nnoremap <leader>rp :!python %:t<CR>
nnoremap <leader>rh :!php %:t<CR>
nnoremap <leader>rn :!node %:t<CR>
nnoremap <leader>rj :!javac %:t && java %:t:r<CR>
nnoremap <leader>rd :!dotnet run<CR>
nnoremap <leader>tp :!python -m unittest<CR>

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h10cANSI
  endif
endif

" Mode normal
inoremap jk <esc>
inoremap <esc> <nop>

" Current word to uppercase
inoremap <c-u> <esc>viwU<esc>A
nnoremap <c-u> viwU<esc>

" Cursor end line
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

" code snippets
" java
iabbrev sso System.out.print

" c#
iabbrev ccw Console.WriteLine
iabbrev ccr Console.ReadLine();

" no close gvim
noremap <s-z> <esc>

" add comment python
nnoremap <leader>ñ I#<esc>

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
nnoremap <leader>N :NERDTreeFind<CR>

" ## vim-closetag
let g:closetag_filenames = "*.html,*.xml,*.blade.php"

" ## Airline
" Mappings to change buffer
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

let g:mta_filetypes = {
    \ 'php' : 1,
    \}

"let g:airline_theme='distinguished'

" ## ctrl-p
nnoremap <leader>f :CtrlP<CR>
set wildignore+=*\\vendor\\*,*\\node_modules\\*,*.swp,*.zip,*.exe  " Windows
