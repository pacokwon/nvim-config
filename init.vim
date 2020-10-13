call plug#begin()

" utility plugins
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/Colorizer'
Plug 'editorconfig/editorconfig-vim'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jdsimcoe/panic.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', { 'commit': '23dda8602f138a9d75dd03803a79733ee783e356'}
Plug 'junegunn/goyo.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
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
Plug 'haishanh/night-owl.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'pacokwon/onedarkpaco.vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on
set termguicolors
set background=dark
syntax on

" ========== Colorscheme Configurations ==========
" ====== vim-solarized8 ======
let g:solarized_visibility="high"
let g:solarized_extra_hi_groups=1

" ====== gruvbox ======
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'

colorscheme gruvbox

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
set nowrap
set backspace=indent,eol,start
set wildmenu
set list
set listchars=eol:⏎,tab:⍿·,space:·,trail:␠,nbsp:⎵
set foldmethod=manual

" search related stuff
set hlsearch
set incsearch
set ignorecase
set smartcase

" enable mouse
set mouse=a
set guicursor=

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
autocmd FileType c nnoremap <silent> <buffer> <F9> :vsplit \| terminal gcc-9 % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType cpp nnoremap <silent> <buffer> <F9> :vsplit \| terminal g++-9 -std=c++17 -Wall -Wextra % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType go nnoremap <silent> <buffer> <F9> :w<CR>:!clear; go run % <CR>
autocmd FileType scala nnoremap <silent> <buffer> <F9> :w<CR>:!clear; scala % <CR>
autocmd FileType javascript nnoremap <silent> <buffer> <F9> :vsplit \| terminal node %<CR>:startinsert<CR>

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
autocmd FileType jsonc syntax match Comment +\/\/.\+$+

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us | set complete+=kspell
autocmd FileType gitcommit setlocal spell spelllang=en_us | set complete+=kspell
autocmd FileType csv set noexpandtab
autocmd FileType typescriptreact setlocal indentexpr=

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
    \'embark': 'embark'
\}

" powerline fonts in airline
let g:airline_powerline_fonts=1
let g:airline_theme=get(theme_mappings, get(g:, 'colors_name', 'default'), 'minimalist')
autocmd ColorScheme * let g:airline_theme=get(theme_mappings, get(g:, 'colors_name', 'default'), 'minimalist')
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
" let g:airline#extensions#coc#enabled = 1
let g:airline_left_sep = "\uE0BC"
let g:airline_left_alt_sep = "\uE0BD"
let g:airline_right_sep = "\uE0BE"
let g:airline_right_alt_sep = "\uE0BF"

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

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
let g:diagnostic_enable_virtual_text = 1
let g:completion_trigger_character = ['.', '::']

lua <<EOF
    local custom_attach = function(client)
        print("'" .. client.name .."' language server started");

        require'completion'.on_attach(client)
        require'diagnostic'.on_attach(client)
    end

    require'nvim_lsp'.gopls.setup{ on_attach=custom_attach }
    require'nvim_lsp'.diagnosticls.setup{
        on_attach = custom_attach,
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        init_options = {
            linters = {
                eslint = {
                    command = './node_modules/.bin/eslint',
                    rootPatterns = { '.git' },
                    debounce = 100,
                    args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
                    sourceName = 'eslint',
                    parseJson = {
                        errorsRoot = '[0].messages',
                        line = 'line',
                        column = 'column',
                        endLine = 'endLine',
                        endColumn = 'endColumn',
                        message = '[eslint] ${message} [${ruleId}]',
                        security = 'severity'
                    },
                    securities = {
                        [2] = 'error',
                        [1] = 'warning'
                    }
                }
            },
            filetypes = {
                javascript = 'eslint',
                javascriptreact = 'eslint',
                typescript = 'eslint',
                typescriptreact = 'eslint'
            },
            formatFiletypes = {
               javascript = 'prettier',
               javascriptreact = 'prettier',
               typescript = 'prettier',
               typescriptreact = 'prettier'
            }
        }
    }
EOF
