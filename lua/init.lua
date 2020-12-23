local nvim_lsp = require('lspconfig')

local attach_formatting = function(client)
    if client.name == "tsserver" then return end

    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
end

local custom_attach = function(client)
    print("'" .. client.name .."' language server started");

    require'completion'.on_attach(client)

    if client.resolved_capabilities.document_formatting then
        attach_formatting(client)
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        update_in_insert = false
    }
)

nvim_lsp.cssls.setup { on_attach=custom_attach }
nvim_lsp.html.setup { on_attach=custom_attach }
nvim_lsp.tsserver.setup { on_attach=custom_attach }
nvim_lsp.clangd.setup{ on_attach=custom_attach }
nvim_lsp.diagnosticls.setup {
    on_attach = custom_attach,
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx' },
    init_options = {
        linters = {
            eslint = {
                command = "./node_modules/.bin/eslint",
                rootPatterns = {".git", ".eslintrc.cjs", ".eslintrc", ".eslintrc.json", ".eslintrc.js"},
                debounce = 100,
                args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
                sourceName = "eslint",
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "[eslint] ${message} [${ruleId}]",
                    security = "severity",
                },
                securities = {[2] = "error", [1] = "warning"},
            }
        },
        filetypes = {
            javascript = 'eslint',
            javascriptreact = 'eslint',
            typescript = 'eslint',
            typescriptreact = 'eslint',
            ["typescript.tsx"] = 'eslint'
        },
        formatters = {
            prettier = {
                command = './node_modules/.bin/prettier',
                rootPatterns = { '.prettierrc', '.git' },
                args = { '--stdin-filepath', '%filename' },
                requiredFiles = { ".prettierrc" },
            }
        },
        formatFiletypes = {
           javascript = 'prettier',
           javascriptreact = 'prettier',
           typescript = 'prettier',
           typescriptreact = 'prettier',
           ["typescript.tsx"] = 'prettier'
        }
    }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'python', 'css', 'html', 'javascript', 'typescript', 'json', 'tsx' },
  highlight = {
    enable = true,
  }
}
