filetype plugin indent on
set termguicolors
set background=dark
syntax on

lua require('init')

" shorthand commands for languages
autocmd FileType python nnoremap <silent> <buffer> <F9> :vsplit \| terminal python %<CR>:startinsert<CR>
autocmd FileType python nnoremap <silent> <buffer> <F10> :vsplit \| terminal python -i %<CR>:startinsert<CR>
autocmd FileType java nnoremap <silent> <buffer> <F9> :vsplit \| terminal javac % && java %<<CR>:startinsert<CR>
autocmd FileType c nnoremap <silent> <buffer> <F9> :vsplit \| terminal gcc % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType cpp nnoremap <silent> <buffer> <F9> :vsplit \| terminal g++ -std=c++17 -Wall -Wextra % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType go nnoremap <silent> <buffer> <F9> :w<CR>:!clear; go run % <CR>
autocmd FileType scala nnoremap <silent> <buffer> <F9> :w<CR>:!clear; scala % <CR>
autocmd FileType javascript nnoremap <silent> <buffer> <F9> :vsplit \| terminal node %<CR>:startinsert<CR>
autocmd FileType sh nnoremap <silent> <buffer> <F9> :split \| terminal ./%<CR>:startinsert<CR>
autocmd FileType rust nnoremap <silent> <buffer> <F9> :split \| terminal rustc % && ./%<<CR>:startinsert<CR>
autocmd BufRead,BufNewFile *.fsx nnoremap <silent> <buffer> <F9> :vsplit \| terminal dotnet fsi %<CR>:startinsert<CR>

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us | set wrap complete+=kspell
autocmd BufWinEnter,BufNewFile * setlocal formatoptions-=o
autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp

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

" ====== colorizer ======
nnoremap <silent> <leader>tc :ColorToggle<CR>

" ====== commentary ======
autocmd FileType jsonc setlocal commentstring=//%s
autocmd FileType fsharp setlocal commentstring=//%s
autocmd FileType asm setlocal commentstring=#%s

" ====== fugitive ======
" launch Git status
nnoremap <leader>gg :vertical Git<CR>
nnoremap <leader>go :tab Git<CR>
nnoremap <leader>gp :Git push<CR>

" open terminal
nnoremap <silent> <leader>tv :vsp term://zsh<CR>
nnoremap <silent> <leader>tn :tabe term://zsh<CR>

" ====== emmet-vim ======
let g:user_emmet_mode='i'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" ====== vim-vue-plugin ======
let g:vim_vue_plugin_load_full_syntax = 1

" ====== vimwiki ======
let g:vimwiki_list = [
    \{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}
\]
let g:vimwiki_conceallevel = 0
nnoremap <leader>wf :Files ~/vimwiki<CR>
nmap <C-h> <Plug>VimwikiDiaryPrevDay
nmap <C-l> <Plug>VimwikiDiaryNextDay

" ====== vifm.vim ======
let g:loaded_netrw          = 1
let g:loaded_netrwPlguin    = 1
let g:vifm_replace_netrw    = 1
nnoremap <silent> <leader>vi :Vifm<CR>

" ====== diagnostic nvim ======
nnoremap <silent>K   :lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gl  :lua vim.diagnostic.open_float({ border = "rounded" })<CR>
nnoremap <silent>gn  :lua vim.diagnostic.goto_next({ float= { border = "rounded" } })<CR>
nnoremap <silent>gp  :lua vim.diagnostic.goto_prev({ float= { border = "rounded" } })<CR>
nnoremap <silent>gd  :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gi  :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>ge  :lua vim.lsp.buf.references()<CR>
nnoremap <silent>ga  :Lspsaga code_action<CR>
nnoremap <silent>gr  :lua vim.lsp.buf.rename()<CR>
nnoremap <silent>go  :lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent>gff :lua vim.lsp.buf.format { async = true }<CR>
xnoremap <silent>gff :lua vim.lsp.buf.format { async = true }<CR>

nnoremap <silent>gfe :lua require'telescope.builtin'.lsp_references()<CR>
nnoremap <silent>gfb :lua require'telescope'.extensions.file_browser.file_browser()<CR>
nnoremap <silent>fb  :Telescope buffers<CR>

nnoremap <silent><C-f> :lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>
nnoremap <silent><C-b> :lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>

" Hint Related Highlight Groups. Underline must be linked manually. see :h hl-LspDiagnosticsUnderlineHint
hi LspDiagnosticsDefaultHint guifg=#FF8E24 gui=undercurl
hi! link LspDiagnosticsUnderlineHint LspDiagnosticsDefaultHint

" Warning Related Highlight Groups
hi LspDiagnosticsDefaultWarning guifg=#FFAE2B gui=undercurl
hi! link LspDiagnosticsUnderlineWarning LspDiagnosticsDefaultWarning

" Error Related Highlight Groups
hi LspDiagnosticsDefaultError guifg=#F74848 gui=undercurl
hi! link LspDiagnosticsUnderlineError LspDiagnosticsDefaultError

hi! link TelescopeSelection LspsagaFinderSelection

let g:vim_vue_plugin_use_typescript = 1
let g:vim_vue_plugin_use_scss = 1

" ====== nvim-telescope ======
nnoremap <expr> <silent> <leader>ff (len(system('git rev-parse')) ? ':lua require"telescope.builtin".find_files()' : ':lua require"telescope.builtin".git_files({ show_untracked = true })')."\<CR>"
nnoremap <silent> <leader>fs :Telescope live_grep<CR>
nnoremap <leader>fgb :lua require'telescope.builtin'.git_branches()<CR>
nnoremap <leader>fgs :lua require'telescope.builtin'.git_status()<CR>

" ====== formatter.nvim ======
nnoremap <silent> <leader>fw :Format<CR>
nnoremap <silent> <leader>fW :FormatWrite<CR>

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
        let width = float2nr(&columns * 0.9)
        let height = float2nr(&lines * 0.9)
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

" Rg command settings
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '~'),
  \   <bang>0)

" search
nnoremap <leader>ft :Rg<CR>
nnoremap <leader>fr :Rg!<CR>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ====== nvim-dap ======
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <S-F5> :lua require'dap'.stop()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>

" Toggle
nnoremap <silent> <leader>bt :lua require'dap'.toggle_breakpoint()<CR>
" Conditional
nnoremap <silent> <leader>bc :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>
" REPL
nnoremap <silent> <leader>br :lua require'dap'.repl.toggle()()<CR>
" Last
nnoremap <silent> <leader>bl :lua require'dap'.run_last()<CR>

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

if !empty(expand(glob("tags")))
    set tags+=./tags
endif

if !empty(expand(glob("cscope.out")))
    cs add ./cscope.out
endif

let g:db = "mysql://pacokwon@localhost/alto"
nnoremap <leader>x :.DB<CR>
xnoremap <leader>x :DB<CR>
