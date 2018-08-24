scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

" Installs vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !curl -fLso ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
end

" vim-plug plugins
call plug#begin("~/.config/nvim/plugged/")

" ## General Utilities
Plug 'vim-airline/vim-airline'  " Status bar & tabline

" ## Navigation Utilities
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General fuzzy finder

" ## Other Utilities
Plug 'yggdroot/indentline'  " Show indentation lines
Plug 'scrooloose/nerdcommenter'  " Comment lines easily
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.

" ## Git Integration
Plug 'airblade/vim-gitgutter'

" ## Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ### Python
"Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" ### JavaScript
Plug 'carlitux/deoplete-ternjs', " run 'npm install -g tern'
Plug 'ternjs/tern_for_vim'

" ### PHP
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }

" Web Development
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'  " Match html tags (colorize tags)
Plug 'ap/vim-css-color', { 'for': 'css' }

" ## Themes & Color Schemes
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'trevordmiller/nova-vim'

call plug#end()



" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
"set title
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
set background=dark
colorscheme gruvbox  " NeoSolarized, nova


" ## Buffers
set hidden  " Allow change buffers without saving


" Mark trailing spaces.
if &t_Co >= 2 || has("gui_running")
    " Fancy highlighting for space groups.
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    " Fallback trailing system.
    set listchars=trail:~
    set list
endif


" Disable aditional files.
set noswapfile " disable swapfiles (maybe a bad idea? 🤔)
set nobackup " disable backup files (use git)
set encoding=utf-8 " windows needs to be reminded about utf-8
set backspace=indent,eol,start " backspace will always work on insert mode



" --------------------------------------------
" Mappings
" --------------------------------------------

" Map <leader> to space and <localleader> to comma
let g:mapleader = ' '
let g:maplocalleader = ','


" Edit init.vim
nnoremap <leader>e :e $MYVIMRC<CR>


" Clear highlighted
nnoremap <silent> <leader>s :nohlsearch<CR>


" Copy current file name
nnoremap <silent> <leader>cf :let @" = expand('%')<CR>


" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y


" Cut to clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d


" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P


" Scroll
nnoremap <up> <c-y>
nnoremap <down> <c-e>


" Search files fzf
nnoremap <leader>f :Files<CR>


" Exit terminal mode with escape
tnoremap <C-q> <C-\><C-n>


" Close buffer
nnoremap <leader>w :bd<CR>


" Save file
nnoremap <leader>s :w<CR>


" Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Go terminal. fg return
map <C-m> <C-z>


" Run current script
nnoremap <leader>rp :!python3 %:t<CR>
nnoremap <leader>rh :!php %:t<CR>
nnoremap <leader>rn :!node %:t<CR>


" Add semicolon at end of line
inoremap <C-s> <C-o>A;



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


" ## Deoplete

let g:deoplete#enable_at_startup = 1


" ### Jedi
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

"let g:deoplete#sources#jedi#show_docstring = 1
"let g:jedi#completions_enabled = 0  " Already provided by deoplete

let g:jedi#goto_command = '<localleader>d'
let g:jedi#goto_assignments_command = '<localleader>g'
let g:jedi#usages_command = '<localleader>n'
let g:jedi#rename_command = '<localleader>r'


" ### Ternjs
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1


" ## Ternjs for vim
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let base16colorspace=256
