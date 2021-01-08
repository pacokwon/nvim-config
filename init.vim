call plug#begin()

" utility plugins
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/Colorizer'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', { 'commit': '23dda8602f138a9d75dd03803a79733ee783e356'}
Plug 'junegunn/goyo.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'peitalin/vim-jsx-typescript'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'voldikss/vim-floaterm'

" colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'haishanh/night-owl.vim'
Plug 'jdsimcoe/panic.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'pacokwon/onedarkpaco.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on
set termguicolors
set background=dark
syntax on

lua require('init')

" ========== Colorscheme Configurations ==========
" ====== vim-solarized8 ======
let g:solarized_visibility="high"
let g:solarized_extra_hi_groups=1

" ====== gruvbox ======
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'

" ====== srcery ======
let g:srcery_italic = 1
let g:srcery_transparent_background = 1
let g:srcery_inverse_matches = 1

" ====== OceanicNext ======
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

colorscheme srcery

" ========== Editor Configurations ==========
set number
set relativenumber
set ruler
set expandtab " Expands tabs to space
set smarttab
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set backspace=indent,eol,start
set wildmenu
set list
set listchars=eol:⏎,tab:⍿·,space:·,trail:␠,nbsp:⎵
set foldmethod=manual

" search related stuff
set hlsearch
set incsearch
set inccommand=split
set ignorecase
set smartcase

" enable mouse
set mouse=a
" block cursor; also reduces latency
set guicursor=
set cursorline

set formatoptions-=a    " No autoformatting
set formatoptions+=c    " Respect textwidth
set formatoptions+=r    " Do continue on enter

if has("clipboard")
    set clipboard=unnamedplus
endif

" set leader to comma
let mapleader=','
let g:mapleader=','

" semicolon remap
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Move line mappings
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

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
nnoremap <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

if has('nvim')
    tnoremap <C-n> <C-\><C-n>
endif

" shorthand commands for languages
autocmd FileType python nnoremap <silent> <buffer> <F9> :vsplit \| terminal python %<CR>:startinsert<CR>
autocmd FileType python nnoremap <silent> <buffer> <F10> :vsplit \| terminal python -i %<CR>:startinsert<CR>
autocmd FileType java nnoremap <silent> <buffer> <F9> :vsplit \| terminal javac % && java %<<CR>:startinsert<CR>
autocmd FileType c nnoremap <silent> <buffer> <F9> :vsplit \| terminal gcc % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType cpp nnoremap <silent> <buffer> <F9> :vsplit \| terminal g++ -std=c++17 -Wall -Wextra % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType go nnoremap <silent> <buffer> <F9> :w<CR>:!clear; go run % <CR>
autocmd FileType scala nnoremap <silent> <buffer> <F9> :w<CR>:!clear; scala % <CR>
autocmd FileType javascript nnoremap <silent> <buffer> <F9> :vsplit \| terminal node %<CR>:startinsert<CR>

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us | set complete+=kspell
autocmd BufWinEnter,BufNewFile * setlocal formatoptions-=o

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType csv set noexpandtab
autocmd FileType gitcommit setlocal spell spelllang=en_us | set complete+=kspell
autocmd FileType jsonc syntax match Comment +\/\/.\+$+

autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}

" ========== Plugin Configurations ==========
" ====== netrw ======
let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide='.*\.swp$'
let g:netrw_localrmdir='rm -r'

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
autocmd FileType netrw setl bufhidden=delete

" ====== black.vim ======
" format on save
autocmd BufWritePre *.py execute ':Black'

" ====== vim-airline ======
let theme_mappings = {
    \'onedarkpaco': 'onedark',
    \'nord': 'nord',
    \'gruvbox': 'gruvbox',
    \'solarized8_high': 'solarized',
    \'solarized8_flat': 'solarized',
    \'solarized8_low': 'solarized',
    \'solarized8': 'solarized',
    \'dracula': 'dracula',
    \'panic': 'panic',
    \'night-owl': 'night_owl',
    \'embark': 'embark',
    \'srcery': 'srcery',
    \'OceanicNext': 'oceanicnext',
    \'xcodedark': 'xcodedark',
    \'xcodedarkhc': 'xcodedarkhc',
    \'xcodelight': 'xcodelight',
    \'xcodelighthc': 'xcodelighthc',
\}

" powerline fonts in airline
let g:airline_powerline_fonts=1
let g:airline_theme=get(theme_mappings, get(g:, 'colors_name', 'default'), 'minimalist')
autocmd ColorScheme * let g:airline_theme=get(theme_mappings, get(g:, 'colors_name', 'default'), 'minimalist')
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_left_sep = "\uE0BC"
let g:airline_left_alt_sep = "\uE0BD"
let g:airline_right_sep = "\uE0BE"
let g:airline_right_alt_sep = "\uE0BF"

" ====== colorizer ======
nnoremap <silent> <leader>tc :ColorToggle<CR>

" ====== fzf & fzf.vim ======
" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu nornu

let g:fzf_commits_log_options = '--all --decorate --oneline --graph'

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
nnoremap <expr> <silent> <leader>ff (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
nnoremap <leader>fb :Buffers<CR>

" Rg command settings
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" search
nnoremap <leader>fs :Rg<CR>
nnoremap <leader>fr :Rg!<CR>

" ====== commentary ======
autocmd FileType jsonc setlocal commentstring=//%s

" ====== fugitive ======
" launch Git status
nnoremap <leader>gg :vertical Gstatus<CR>
nnoremap <leader>go :Gstatus \| only<CR>
nnoremap <leader>gp :Gpush<CR>

" ====== vim-floaterm ======
nnoremap <silent> <leader>tn :FloatermNew<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>

" ====== emmet-vim ======
let g:user_emmet_mode='i'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" ====== goyo ======
let g:goyo_width=120

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set wrap
  set linebreak
  set scrolloff=999
  nnoremap 0 g0
  nnoremap $ g$
  nnoremap j gj
  vnoremap j gj
  nnoremap k gk
  vnoremap k gk
  " ...
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set nowrap
  set nolinebreak
  set scrolloff=5
  unmap j
  unmap k
  unmap 0
  unmap $
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <silent> <leader>gy :Goyo<CR>

" ====== vim-vue-plugin ======
let g:vim_vue_plugin_load_full_syntax = 1

" ====== vim-gitgutter ======
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

" ====== vimwiki ======
let g:vimwiki_list = [
    \{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}
\]
let g:vimwiki_conceallevel = 1
nnoremap <leader>wf :Files ~/vimwiki<CR>
nmap <C-h> <Plug>VimwikiDiaryPrevDay
nmap <C-l> <Plug>VimwikiDiaryNextDay

" ====== vifm.vim ======
let g:loaded_netrw          = 1
let g:loaded_netrwPlguin    = 1
let g:vifm_replace_netrw    = 1

" ====== vim-go ======
let g:go_auto_type_info = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" ====== diagnostic nvim ======
nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gd :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>ga :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent>gn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent>gp :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent>go :lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent>gl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent>gr :lua vim.lsp.buf.rename()<CR>
nnoremap <silent>gf :lua vim.lsp.buf.formatting()<CR>

" Hint Related Highlight Groups. Underline must be linked manually. see :h hl-LspDiagnosticsUnderlineHint
hi LspDiagnosticsDefaultHint guifg=#FF8E24 gui=undercurl
hi! link LspDiagnosticsUnderlineHint LspDiagnosticsDefaultHint

" Warning Related Highlight Groups
hi LspDiagnosticsDefaultWarning guifg=#FFAE2B gui=undercurl
hi! link LspDiagnosticsUnderlineWarning LspDiagnosticsDefaultWarning

" Error Related Highlight Groups
hi LspDiagnosticsDefaultError guifg=#F74848 gui=undercurl
hi! link LspDiagnosticsUnderlineError LspDiagnosticsDefaultError

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
let g:completion_trigger_character = ['.', '::']
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
