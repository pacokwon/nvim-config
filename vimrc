filetype plugin indent on
" let g:material_style='oceanic' " palenight | oceanic | or don't set at all
set termguicolors " this one's real important, don't get why
set background=dark
syntax on
colorscheme xcodedark

" prevent syntax from breaking
autocmd BufEnter * :syntax sync fromstart

" editor configurations
set number
set relativenumber
set ruler
set expandtab " Expands tabs to space
set smarttab
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set nowrap
set backspace=indent,eol,start
" set shell=zsh\ -i

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
let g:airline_theme='wombat'
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
nnoremap c "_c
nnoremap C "_C
nnoremap s "_s
vnoremap d "_d
vnoremap c "_c
vnoremap p "_dp

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
vnoremap y y`]

" launch netrw
nnoremap <leader>t :tabe . <CR>

" open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Files command with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" GFiles command with preview
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" In git repo, use :GFiles!, use :Files! otherwise
nnoremap <expr> <leader>f (len(system('git rev-parse')) ? ':Files!' : ':GFiles! --exclude-standard --others --cached')."\<CR>"

" Rg command settings
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" search
nnoremap <leader>ss :Rg<CR>
nnoremap <leader>sf :Rg!<CR>

"======================================="

" shorthand commands for languages
autocmd FileType python nnoremap <buffer> <F9> :w<CR>:exec '!clear; python' shellescape(@%, 1)<CR>
autocmd FileType python nnoremap <buffer> <F10> :w<CR>:exec '!clear; python -i' shellescape(@%, 1)<CR>
autocmd FileType java nnoremap <buffer> <F9> :w<CR>:!clear; javac % && java %< <CR>
autocmd FileType c nnoremap <buffer> <F9> :w<CR>:!clear; gcc-9 % -o %< && ./%< <CR>
autocmd FileType cpp nnoremap <buffer> <F9> :w<CR>:!clear; g++-9 -std=c++17 -Wall -Wextra % -o %< && ./%< <CR>
autocmd FileType matlab nnoremap <buffer> <F9> :w<CR>:!clear; matlab %<CR>
autocmd FileType go nnoremap <buffer> <F9> :w<CR>:!clear; go run % <CR>

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

