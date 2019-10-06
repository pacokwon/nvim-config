filetype plugin indent on

" colors
" let g:material_style='oceanic' " palenight | oceanic | or don't set at all
set background=dark
syntax on
colorscheme gruvbox_paco
set termguicolors " this one's real important, don't get why

" prevent syntax from breaking
autocmd BufEnter * :syntax sync fromstart

" editor configurations
set relativenumber
set ruler
set expandtab " Expands tabs to space
set smarttab
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set nowrap

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

" fzf setup
set rtp+=/usr/local/opt/fzf

"============ Netrw Config ============"

" <CR> to open subdirectory
"    v to open file in vsplit
"    t to open file in tab
let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide='.*\.swp$'
let g:netrw_localrmdir='rm -r'
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
autocmd FileType netrw setl bufhidden=delete

"====================================="


"============ Airline Config ============"

" powerline fonts in airline
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

"========================================"

let mapleader=','
let g:mapleader=','

"============ Custom Mappings ============"

" semicolon remap
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

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
nnoremap C "_C
vnoremap c "_c


" alternative for cut
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d
nnoremap <leader>c ""c
nnoremap <leader>C ""C
vnoremap <leader>c ""c

" keybinding for efficient vertical navigation
nnoremap <C-J> 10j
nnoremap <C-K> 10k
vnoremap <C-J> 10j
vnoremap <C-K> 10k

" keybinding for tab navigation
nnoremap <C-N> gt
nnoremap <C-P> gT

" somehow this line is needed
nnoremap p ""p

" cursor position after yank
vmap y y`]

nnoremap <leader>t :tabe . <CR>

" open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" respect gitignore
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <expr> <leader>f (len(system('git rev-parse')) ? ':Files!' : ':GFiles! --exclude-standard --others --cached')."\<CR>"
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \                 <bang>0)

" search
nnoremap <leader>ss :Ag<CR>

" search fullscreen
nnoremap <leader>sf :Ag!<CR>

"======================================="

" shorthand commands for languages
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<CR>
autocmd FileType python nnoremap <buffer> <F10> :exec '!clear; python -i' shellescape(@%, 1)<CR>
autocmd FileType java nnoremap <buffer> <F9> :w<CR>:!clear; javac % && java %< <CR>
autocmd FileType c nnoremap <buffer> <F9> :w<CR>:!clear; gcc % -o %< && ./%< <CR>

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
