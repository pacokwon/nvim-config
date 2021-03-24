local nvim_lsp = require('lspconfig')
local saga = require('lspsaga')

saga.init_lsp_saga {
    code_action_prompt = {
        enable = true,
        sign = false,
        virtual_text = true,
    }
}

local custom_attach = function(client)
    print("'" .. client.name .."' language server started");
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        update_in_insert = false
    }
)

nvim_lsp.cssls.setup { on_attach=custom_attach }
nvim_lsp.html.setup { on_attach=custom_attach }
nvim_lsp.tsserver.setup {
    on_attach = custom_attach,
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue'  }
}
-- nvim_lsp.clangd.setup { on_attach=custom_attach }
nvim_lsp.rust_analyzer.setup { on_attach=custom_attach }
nvim_lsp.vuels.setup { on_attach=custom_attach }
nvim_lsp.pyls.setup { on_attach=custom_attach }
nvim_lsp.ocamllsp.setup { on_attach=custom_attach }
nvim_lsp.diagnosticls.setup {
    on_attach = custom_attach,
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
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
            ["typescript.tsx"] = 'eslint',
            vue = 'eslint',
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
           ["typescript.tsx"] = 'prettier',
           vue = 'prettier',
        }
    }
}

require'compe'.setup {
    enabled = true;
    autocomplete = true;
    min_length = 1;
    source = {
        path = true;
        buffer = true;
        nvim_lsp = true;
        spell = true;
    };
}
