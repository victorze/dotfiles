scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'digitaltoad/vim-pug'
Plug 'jwalton512/vim-blade'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'neoclide/vim-jsx-improve'
Plug 'posva/vim-vue'

Plug 'morhetz/gruvbox'
Plug 'victorze/foo'
Plug 'cocopon/iceberg.vim'
call plug#end()


" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
set mouse=a
set hlsearch
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
autocmd FileType gitcommit setlocal colorcolumn=72 tw=72

" ## Theme & Colorscheme
set termguicolors
let g:gruvbox_contrast_dark = "hard"
set background=dark
colorscheme hyper
let g:airline_theme='distinguished'

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
nnoremap <leader>g :so $VIMRUNTIME/syntax/hitest.vim<CR>

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

" Top cursor on screen
nnoremap <localleader>g zz15<c-e>

" Run app
nnoremap <leader>rp :!clear && python3 %:t<CR>
nnoremap <leader>rh :!clear && php %:t<CR>
nnoremap <leader>rn :!clear && node %:t<CR>

" Current word to uppercase
inoremap <c-u> <esc>viwU<esc>Ea
nnoremap <c-u> viwU<esc>


" --------------------------------------------
" # Plugins Settings
" --------------------------------------------

" ## NerdTree
" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$',
    \ '\.git$', 'node_modules$', '^\~$'
    \]

let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden = 1

nnoremap <leader>n :NERDTreeToggle<CR>


" ## ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*,*/venv/*,*/build/*,*/~/*;


" ## Airline
" Mappings to change buffer
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

let g:mta_filetypes = {
    \ 'php' : 1,
    \}
