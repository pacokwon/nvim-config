filetype plugin indent on

" colors
set background=dark
syntax on
colorscheme onedark
set termguicolors " this one's real important, don't get why

" editor configurations
set number
set relativenumber
set ruler
set expandtab " Expands tabs to space
set smarttab
set shiftwidth=4
set tabstop=4

" search related stuff
set hlsearch
set incsearch
set ignorecase
set smartcase

" enable mouse
set mouse=a

if has("clipboard")
    set clipboard=unnamed
endif

" ctags path
set tags=./tags,tags;

" recursive find
set path+=**
" menu on tab
set wildmenu

" <CR> to open subdirectory
"    v to open file in vsplit
"    t to open file in tab
let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Airline Configs
" powerline fonts in airline
let g:airline_powerline_fonts=1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
" leader key
let mapleader=","
let g:mapleader=","


"============ Custom Mappings ============"

" semicolon remap
map ; :

" open vimrc
map <leader>rc :tabe $MYVIMRC<CR>

" Bracket Autocomplete
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

" Move line mappings
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" delete and not cut
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap c "_c
vnoremap c "_c

" alternative for cut
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d
nnoremap <leader>c ""c
vnoremap <leader>c ""c

" somehow this line is needed
nnoremap p ""p

" shorthand commands for languages
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<CR>
autocmd FileType python nnoremap <buffer> <F10> :exec '!clear; python3 -i' shellescape(@%, 1)<CR>
autocmd FileType java nnoremap <buffer> <F9> :w<CR>:!javac % && java %< <CR>
autocmd FileType c nnoremap <buffer> <F9> :w<CR>:!clear; gcc % -o %< && ./%< <CR>
