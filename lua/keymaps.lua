local api = vim.api
local g = vim.g
local keymap = vim.keymap

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- set leader to space
g.mapleader = ' '

-- for visual block yanking
api.nvim_set_keymap('', 'p', '<Plug>(miniyank-autoput)', {})
api.nvim_set_keymap('', 'P', '<Plug>(miniyank-autoPut)', {})

-- Move line mappings
map('n', '<S-Down>', ':m .+1<CR>==')
map('n', '<S-Up>', ':m .-2<CR>==')
map('i', '<S-Down>', '<Esc>:m .+1<CR>==gi')
map('i', '<S-Up>', '<Esc>:m .-2<CR>==gi')
map('v', '<S-Down>', ":m '>+1<CR>gv=gv")
map('v', '<S-Up>', ":m '<-2<CR>gv=gv")

map('n', '<leader>o', 'o<ESC>k')

-- delete and not cut
map('n', 'x', '"_x')
map('n', 'd', '"_d')
map('n', 'D', '"_D')
map('n', 'c', '"_c')
map('n', 'C', '"_C')
map('n', 's', '"_s')
map('v', 'd', '"_d')
map('v', 'c', '"_c')
map('v', 's', '"_s')
map('v', 'p', '"_dP')
map('i', 'π', '<C-R>+')

-- alternative for cut
map('n', '<leader>d', '"+d')
map('n', '<leader>D', '"+D')
map('v', '<leader>d', '"+d')
map('n', '<leader>c', '"+c')
map('n', '<leader>C', '"+C')
map('v', '<leader>c', '"+c')

-- keybinding for efficient vertical navigation
map('n', '<C-J>', '10j')
map('n', '<C-K>', '10k')
map('v', '<C-J>', '10j')
map('v', '<C-K>', '10k')

-- keybinding for tab navigation
map('n', '<C-N>', '<cmd>bnext<CR>', { silent = true })
map('n', '<C-P>', '<cmd>bprevious<CR>', { silent = true })

map('n', '<S-y>', 'y$')
-- cursor position after yank
map('v', 'y', 'y`]')

-- open vimrc
map('n', '<leader>ve', '<cmd>vsplit $MYVIMRC<CR>')
map('n', '<leader>vs', '<cmd>source $MYVIMRC<CR>')

map('n', '<leader>pbb', '<cmd>let @+ = expand("%")<CR>')
map('n', '<leader>pbt', '<cmd>let @+ = expand("%:t")<CR>')
map('n', '<leader>pbp', '<cmd>let @+ = expand("%:p")<CR>')

-- fugitive
map('n', '<leader>gg', '<cmd>vertical Git<CR>')
map('n', '<leader>gg', '<cmd>tab Git<CR>')
map('n', '<leader>gg', '<cmd>Git push<CR>')

map('n', '<leader>tv', '<cmd>vsp term://zsh<CR>')
map('n', '<leader>tn', '<cmd>tabe term://zsh<CR>')

map('n', 'K',   '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
map('n', 'gl',  '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', { silent = true })
map('n', 'gn',  '<cmd>lua vim.diagnostic.goto_next({ float= { border = "rounded" } })<CR>', { silent = true })
map('n', 'gp',  '<cmd>lua vim.diagnostic.goto_prev({ float= { border = "rounded" } })<CR>', { silent = true })
map('n', 'gd',  '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true })
map('n', 'gi',  '<cmd>lua vim.lsp.buf.implementation()<CR>', { silent = true })
map('n', 'ge',  '<cmd>lua vim.lsp.buf.references()<CR>', { silent = true })
map('n', 'ga',  '<cmd>Lspsaga code_action<CR>', { silent = true })
map('n', 'gr',  '<cmd>lua vim.lsp.buf.rename()<CR>', { silent = true })
map('n', 'go',  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { silent = true })
map('n', 'gff', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { silent = true })
map('n', 'gff', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { silent = true })

-- formatter.nvim
map('n', '<leader>fw', ':Format<CR>', { silent = true })
map('n', '<leader>fW', ':FormatWrite<CR>', { silent = true })

-- telescope
map('n', 'gfe', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', { silent = true })
map('n', 'gfb', '<cmd>lua require"telescope".extensions.file_browser.file_browser()<CR>', { silent = true })
map('n', 'fb',  '<cmd>Telescope buffers<CR>', { silent = true })
map('n', '<leader>ft', '<cmd>Telescope grep_string search=<CR>', { silent = true })
map('n', '<leader>fgb', '<cmd>lua require"telescope.builtin".git_branches()<CR>')
map('n', '<leader>fgs', '<cmd>lua require"telescope.builtin".git_status()<CR>')

-- nvim dap
map('n', '<F5>', ':lua require"dap".continue()<CR>', { silent = true })
map('n', '<S-F5>', ':lua require"dap".stop()<CR>', { silent = true })
map('n', '<F6>', ':lua require"dap".step_over()<CR>', { silent = true })
map('n', '<F7>', ':lua require"dap".step_into()<CR>', { silent = true })
map('n', '<F8>', ':lua require"dap".step_out()<CR>', { silent = true })
map('n', '<leader>bt', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>bc', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint Condition: "))<CR>', { silent = true })
map('n', '<leader>br', ':lua require"dap".repl.toggle()()<CR>', { silent = true })
map('n', '<leader>bl', ':lua require"dap".run_last()<CR>', { silent = true })
