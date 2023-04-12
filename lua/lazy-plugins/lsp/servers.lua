local lspconfig = require 'lspconfig'
local util = require 'lspconfig/util'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local custom_attach = function(client)
    print("'" .. client.name .."' language server started");
    vim.lsp.handlers['textDocument/hover'] =  vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] =  vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            prefix = '●'
        },
        update_in_insert = false
    }
)

lspconfig.cssls.setup { on_attach = custom_attach }
lspconfig.html.setup { on_attach = custom_attach }
lspconfig.tsserver.setup {
    on_attach = custom_attach,
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue'  }
}
lspconfig.clangd.setup { on_attach = custom_attach }
lspconfig.rust_analyzer.setup { on_attach = custom_attach }
lspconfig.pylsp.setup { on_attach = custom_attach }
