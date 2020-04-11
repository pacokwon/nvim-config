call plug#begin()

" utility plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'jdsimcoe/panic.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorschemes
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim'
Plug 'lifepillar/vim-solarized8'
Plug 'pacokwon/onedarkpaco.vim'

call plug#end()

filetype plugin indent on
set termguicolors
set background=dark
syntax on
colorscheme onedarkpaco

" set high contrast for solarized8
let g:solarized_visibility="high"

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
    set clipboard=unnamedplus
endif

" menu on tab
set wildmenu

" set leader to comma
let mapleader=','
let g:mapleader=','

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
vnoremap s "_s
vnoremap p "_dP
inoremap π <C-R>+

" alternative for cut
nnoremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d
nnoremap <leader>c "+c
nnoremap <leader>C "+C
vnoremap <leader>c "+c

" keybinding for efficient vertical navigation
nnoremap <C-J> 10j
nnoremap <C-K> 10k
vnoremap <C-J> 10j
vnoremap <C-K> 10k

" keybinding for tab navigation
nnoremap <C-N> gt
nnoremap <C-P> gT

" cursor position after yank
vnoremap y y`]

" open terminal
nnoremap <silent> <leader>tv :vsp term://zsh<CR>
nnoremap <silent> <leader>th :sp term://zsh<CR>

" open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" shorthand commands for languages
autocmd FileType python nnoremap <buffer> <F9> :vsplit \| terminal python %<CR>:startinsert<CR>
autocmd FileType python nnoremap <buffer> <F10> :vsplit \| terminal python -i %<CR>:startinsert<CR>
autocmd FileType java nnoremap <buffer> <F9> :vsplit \| terminal javac % && java %<<CR>:startinsert<CR>
autocmd FileType c nnoremap <buffer> <F9> :vsplit \| terminal gcc % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType cpp nnoremap <buffer> <F9> :vsplit \| terminal g++ -std=c++17 -Wall -Wextra % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType go nnoremap <buffer> <F9> :w<CR>:!clear; go run % <CR>
autocmd FileType scala nnoremap <buffer> <F9> :w<CR>:!clear; scala % <CR>

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set guicursor=

" ========== Plugin Configurations ==========
" ====== black.vim ======
" format on save
autocmd BufWritePre *.py execute ':Black'

" ====== coc.nvim ======
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ====== vim-airline ======
" powerline fonts in airline
let g:airline_powerline_fonts=1
let g:airline_theme='night_owl'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#coc#enabled = 1

" ====== fzf & fzf.vim ======
" If installed using Homebrew

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=20

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

set rtp+=/usr/local/opt/fzf

" Files command with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" GFiles command with preview
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" In git repo, use :GFiles!, use :Files! otherwise
nnoremap <expr> <silent> <leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"

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

" ====== fugitive ======
" launch Git status
nnoremap <leader>g :G<CR>

" ====== emmet-vim ======
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
