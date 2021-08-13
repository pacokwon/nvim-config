local api = vim.api
local g = vim.g

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
map('n', '<C-N>', 'gt')
map('n', '<C-P>', 'gT')

map('n', '<S-y>', 'y$')
-- cursor position after yank
map('v', 'y', 'y`]')

-- open vimrc
map('n', '<leader>ve', ':vsplit $MYVIMRC<CR>')
map('n', '<leader>vs', ':source $MYVIMRC<CR>')

map('n', '<leader>pbb', ':let @+ = expand("%")<CR>')
map('n', '<leader>pbt', ':let @+ = expand("%:t")<CR>')
map('n', '<leader>pbp', ':let @+ = expand("%:p")<CR>')
