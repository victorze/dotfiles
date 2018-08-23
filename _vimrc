scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

" Init vim-plug plugins
call plug#begin('~/.vim/plugged/')

" General purpose plugins
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'

" Language support
Plug 'alvan/vim-closetag'
Plug 'davidhalter/jedi-vim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kaicataldo/material.vim'
call plug#end()


" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
set title
set mouse=a
set noshowmode

set colorcolumn=80  " Set & show limit column
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
let g:material_theme_style = 'dark'
set background=dark
colorscheme gruvbox

" Mark trailing spaces.
if &t_Co > 2 || has("gui_running")
    highlight ExtraWhitespace ctermbg=red guibg=red
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



" --------------------------------------------
" # Mappings
" --------------------------------------------

" ## Map <leader> to space and <localleader> to comma
let g:mapleader = ' '
let g:maplocalleader = ','


" ## Edit _vimrc
nnoremap <leader>e :e ~\_vimrc<CR>


" ## Clear highlighted
nnoremap <silent> <leader>s :nohlsearch<CR>


" ## Copy current file name
nnoremap <silent> <leader>cf :let @" = expand('%')<CR>


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


" ## Open terminal (Cmder)
nnoremap <leader>t :term bash<CR>


" ## Close buffer
nnoremap <leader>w :bd<CR>


" ## Close all buffers
nnoremap <leader>kw :bufdo bd<CR>


" ## Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" ## Run current script
nnoremap <leader>rp :!python %:t<CR>
nnoremap <leader>rh :!php %:t<CR>
nnoremap <leader>rn :!node %:t<CR>


" Relative numbering
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>a


" ## GVIM setting
set guioptions-=m  " hide the menu bar
set guioptions-=T  " hide the menu tools
set guioptions-=r  " hide the bar scroll
set guioptions-=L  " hide the bar scroll
set linespace=3


set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

au GUIEnter * simalt ~x " start gVim maximized

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
"let NERDTreeQuitOnOpen=1
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


" ### Jedi
let g:jedi#goto_command = '<localleader>d'
let g:jedi#goto_assignments_command = '<localleader>g'
let g:jedi#usages_command = '<localleader>n'
let g:jedi#rename_command = '<localleader>r'
let g:jedi#auto_initialization = 0

" ## Ctrl-P remapping
let g:ctrlp_map = '<Leader>f'
