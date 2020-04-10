scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'digitaltoad/vim-pug'
Plug 'jwalton512/vim-blade'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'neoclide/vim-jsx-improve'
Plug 'posva/vim-vue'

Plug 'cseelus/vim-colors-lucid'
Plug 'morhetz/gruvbox'
Plug 'victorze/foo'
Plug 'cocopon/iceberg.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'wadackel/vim-dogrun'
Plug 'kaicataldo/material.vim'
call plug#end()


" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
set notitle
set mouse=a
set noshowmode
set guicursor+=a:blinkon0
set hlsearch

set colorcolumn=80      " Set & show limit column
set scrolloff=3         " Display at least 3 lines around you cursor

" ## Lines
set nowrap                  " No wrap lines (display long lines)
set number                  " Display line numbers
set relativenumber          " Show relative line numbers
set fileformats=unix,dos    " End of line LF
set fileformat=unix

" ## Indentation
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
autocmd Filetype pug setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 sts=0 expandtab

autocmd FileType gitcommit setlocal colorcolumn=72 tw=72

" ## Theme & Colorscheme
set termguicolors  " Active true colors on terminal
let g:gruvbox_contrast_dark = "hard"
set background=dark
let ayucolor="mirage"
colorscheme hyper
let g:airline_theme='distinguished'

"hi jinjaTagDelim guifg=#a763a7
"hi bladeKeyword guifg=#db0088

" lucid
"hi ColorColumn guibg=#312e38
"hi MatchParen guifg=NONE guibg=NONE
"hi Comment cterm=NONE

" default
"hi LineNr guifg=#495162
"hi CursorLineNr guifg=#a7aebe
"hi NonText guifg=NONE


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

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Cut to clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Copy word
nnoremap <leader>c yiw

" Close buffer
nnoremap <leader>w :bd<CR>

" Close all buffers
nnoremap <localleader>w :bufdo bd<CR>

" Save file
nnoremap <leader>s :w<CR>

" Save all files
nnoremap <localleader>s :wa<CR>

" Current word to uppercase
inoremap <c-u> <esc>viwU<esc>Ea
nnoremap <c-u> viwU<esc>

" Select content document
nnoremap <leader>a ggvG$

" Format a block of code {  }
nnoremap <localleader>f vi{=<esc>

" Format document
nnoremap <leader>f ggvG$=<esc>

" Insert mode to normal mode
inoremap jk <esc>

" Go to the beginning of the current line
nnoremap H 0
vnoremap H 0

" Go to the end of the current line
nnoremap L $
vnoremap L $

" Disabling the old keys
inoremap <esc> <nop>
nnoremap $ <nop>
nnoremap 0 <nop>

" You can see all the groups - Highlight
nnoremap <leader>g :so $VIMRUNTIME/syntax/hitest.vim<CR>

" Copy the full path of current buffer to clipboard
nnoremap <localleader>p :let @+=expand('%:p')<CR>

" Top cursor on screen
nnoremap <localleader>g zz15<c-e>

" Run app
nnoremap <leader>rp :!clear && python3 %:t<CR>
"nnoremap <leader>tp :!python -m unittest discover<CR>
nnoremap <leader>tp :!python3 -m pytest<CR>
nnoremap <leader>rh :!clear && php %:t<CR>
nnoremap <leader>th :!./vendor/bin/phpunit<CR>
nnoremap <leader>rn :!clear && node %:t<CR>
nnoremap <leader>rs :!npm run build<CR>
nnoremap <leader>tn :!clear && npm run test<CR>
nnoremap <leader>rc :!clear && gcc -Wall -g -std=c17 % && ./a.out<CR>
nnoremap <leader>rl :!clear && g++ -Wall -g -std=c++17 % && ./a.out<CR>
nnoremap <leader>rb :!bash %:t<CR>
nnoremap <leader>ra :!nasm -f elf64 % -o a.o && ld -o a a.o && ./a<CR>
nnoremap <leader>rj :!javac %:t && java %:t:r<CR>
nnoremap <leader>rr :!cargo run<CR>
nnoremap <leader>rk :!cargo check<CR>
nnoremap <leader>rd :!dotnet run<CR>
nnoremap <leader>td :!dotnet test<CR>

" Add semicolon
inoremap <c-l> <esc>A;
nnoremap <c-l> A;<esc>

" Abbreviations
iabbrev sop System.out.print
iabbrev cl console.log(
iabbrev clt console.table(
iabbrev cw Console.WriteLine(

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
    " prompt $p$_$g$s
endif


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

"  ## LANGUAGE SERVER PROTOCOL

set completeopt-=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:lsp_diagnostics_enabled = 0 " disable diagnostics support (warnings, errors)
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Command LSP
nnoremap <localleader>d :LspDefinition<CR>
nnoremap <localleader>r :LspReferences<CR>

" Close preview window
nnoremap <localleader>c :pclose<CR>
