require'plugins.lsp.servers'
require'lspsaga'.init_lsp_saga({
    -- use emoji lightbulb in default
    code_action_icon = "",
})

local define_diagnostic_sign = function(group, text)
    vim.fn.sign_define(group, { texthl = group, text = text, numhl = group})
end
define_diagnostic_sign("DiagnosticSignWarn",  "")
define_diagnostic_sign("DiagnosticSignHint",  "")
define_diagnostic_sign("DiagnosticSignInfo",  "")
define_diagnostic_sign("DiagnosticSignError", "")

local keymap = vim.keymap
keymap.set('n', 'K',   function() vim.lsp.buf.hover() end, { silent = true })
keymap.set('n', 'gl',  function() vim.diagnostic.open_float({ border = "rounded" }) end, { silent = true })
keymap.set('n', 'gn',  function() vim.diagnostic.goto_next({ float= { border = "rounded" } }) end, { silent = true })
keymap.set('n', 'gp',  function() vim.diagnostic.goto_prev({ float= { border = "rounded" } }) end, { silent = true })
keymap.set('n', 'gd',  function() vim.lsp.buf.definition() end, { silent = true })
keymap.set('n', 'gi',  function() vim.lsp.buf.implementation() end, { silent = true })
keymap.set('n', 'ge',  function() vim.lsp.buf.references() end, { silent = true })
keymap.set('n', 'gr',  function() vim.lsp.buf.rename() end, { silent = true })
keymap.set('n', 'go',  function() vim.lsp.diagnostic.set_loclist() end, { silent = true })
keymap.set('n', 'gff', function() vim.lsp.buf.format { async = true } end, { silent = true })
keymap.set('n', 'gff', function() vim.lsp.buf.format { async = true } end, { silent = true })
keymap.set('n', 'ga',  '<cmd>Lspsaga code_action<CR>', { silent = true })
