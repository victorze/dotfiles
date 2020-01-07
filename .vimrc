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

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-pug'
Plug 'jwalton512/vim-blade'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'neoclide/vim-jsx-improve'
Plug 'posva/vim-vue'

Plug 'cseelus/vim-colors-lucid'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'sjl/badwolf'
Plug 'victorze/foo'
Plug 'cocopon/iceberg.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim'
Plug 'tomasiser/vim-code-dark'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhartington/oceanic-next'
call plug#end()


" --------------------------------------------
" # Settings
" --------------------------------------------

" ## GUI
set notitle
set mouse=a
set noshowmode

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
nnoremap <leader>rh :!php %:t<CR>
nnoremap <leader>th :!./vendor/bin/phpunit<CR>
nnoremap <leader>rn :!clear && node %:t<CR>
nnoremap <leader>rs :!npm run build<CR>
nnoremap <leader>rc :!clear && gcc -Wall % && ./a.out<CR>
nnoremap <leader>rl :!g++ % && ./a.out<CR>
nnoremap <leader>rb :!bash %:t<CR>
nnoremap <leader>ra :!nasm -f elf64 % -o a.o && ld -o a a.o && ./a<CR>
nnoremap <leader>rj :!javac %:t && java %:t:r<CR>
nnoremap <leader>rr :!cargo run<CR>
nnoremap <leader>rk :!cargo check<CR>
nnoremap <leader>rd :!dotnet run<CR>
nnoremap <leader>td :!dotnet test<CR>

" Delete spaces at end of line in current file
nnoremap <localleader>c :%s/\s\+$//e<CR>

" Consult documentation in Zeal
nnoremap <leader>z :!zeal "<cword>"<CR><CR>

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


" ## Airline
" Mappings to change buffer
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

let g:mta_filetypes = {
    \ 'php' : 1,
    \}

" ## ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*,*/venv/*,*/build/*,*/~/*;


"  ## LANGUAGE SERVER PROTOCOL

" Python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {'jedi': {'environment': '/home/victorze/.local/share/virtualenvs/flasky-IQlH4ERO'}}}}
        \ })
endif

" PHP
au User lsp_setup call lsp#register_server({
    \ 'name': 'intelephense',
    \ 'cmd': {server_info->['intelephense', '--stdio']},
    \ 'initialization_options': {"storagePath": "~/.temp-lsp/intelephense"},
    \ 'whitelist': ['php'],
    \ 'workspace_config': { 'intelephense': {
    \   'files.associations': ['*.php'],
    \ }},
    \ })

" Typescript
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif

" Javascript
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
      \ })
endif

" Rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

inoremap <expr> <c-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Tab to show the autocomplete
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Command LSP
nnoremap <localleader>d :LspDefinition<CR>
nnoremap <localleader>sr :LspReferences<CR>
nnoremap <localleader>st :LspTypeDefinition<CR>
nnoremap <localleader>sd :LspDocumentDiagnostics<CR>
