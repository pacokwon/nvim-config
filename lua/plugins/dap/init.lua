require("nvim-dap-virtual-text").setup({
    virt_text_win_col = 80,
    highlight_changed_variables = true
})
require'plugins.dap.typescript'

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

local keymap = vim.keymap
-- nvim dap
keymap.set('n', '<F5>',       function() require'dap'.continue() end, { silent = true })
keymap.set('n', '<S-F5>',     function() require'dap'.stop() end, { silent = true })
keymap.set('n', '<F6>',       function() require'dap'.step_over() end, { silent = true })
keymap.set('n', '<F7>',       function() require'dap'.step_into() end, { silent = true })
keymap.set('n', '<F8>',       function() require'dap'.step_out() end, { silent = true })
keymap.set('n', '<leader>bt', function() require'dap'.toggle_breakpoint() end)
keymap.set('n', '<leader>bc', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: ')) end, { silent = true })
keymap.set('n', '<leader>br', function() require'dap'.repl.toggle()() end, { silent = true })
keymap.set('n', '<leader>bl', function() require'dap'.run_last() end, { silent = true })
