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
nnoremap <silent> <leader>ft :Telescope grep_string search=<CR>
nnoremap <leader>fgb :lua require'telescope.builtin'.git_branches()<CR>
nnoremap <leader>fgs :lua require'telescope.builtin'.git_status()<CR>

" ====== formatter.nvim ======
nnoremap <silent> <leader>fw :Format<CR>
nnoremap <silent> <leader>fW :FormatWrite<CR>

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
