return {
    {
        'neovim/nvim-lspconfig',
        keys = {
            { 'K',   function() vim.lsp.buf.hover() end, silent = true },
            { 'gl',  function() vim.diagnostic.open_float({ border = "rounded" }) end, silent = true },
            { 'gn',  function() vim.diagnostic.goto_next({ float= { border = "rounded" } }) end, silent = true },
            { 'gp',  function() vim.diagnostic.goto_prev({ float= { border = "rounded" } }) end, silent = true },
            { 'gd',  function() vim.lsp.buf.definition() end, silent = true },
            { 'gi',  function() vim.lsp.buf.implementation() end, silent = true },
            { 'ge',  function() vim.lsp.buf.references() end, silent = true },
            { 'gr',  function() vim.lsp.buf.rename() end, silent = true },
            { 'go',  function() vim.lsp.diagnostic.set_loclist() end, silent = true },
            { 'gff', function() vim.lsp.buf.format { async = true } end, mode = { 'n', 'v' }, silent = true },
        },
        config = function()
            local define_diagnostic_sign = function(group, text)
                vim.fn.sign_define(group, { texthl = group, text = text, numhl = group})
            end
            define_diagnostic_sign("DiagnosticSignWarn",  "")
            define_diagnostic_sign("DiagnosticSignHint",  "")
            define_diagnostic_sign("DiagnosticSignInfo",  "")
            define_diagnostic_sign("DiagnosticSignError", "")

            require'lazy-plugins.lsp.servers'
        end,
    },
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-null-ls.nvim',
    {
        'williamboman/mason.nvim',
        config = function()
            require'lazy-plugins.lsp.mason'
        end,
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require'lazy-plugins.lsp.null-ls'
        end,
    }
}
