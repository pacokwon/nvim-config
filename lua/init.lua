local nvim_lsp = require('nvim_lsp')

local custom_attach = function(client)
    print("'" .. client.name .."' language server started");

    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
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
nvim_lsp.tsserver.setup { on_attach=custom_attach }
-- nvim_lsp.diagnosticls.setup {
--     on_attach = custom_attach,
--     filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
--     init_options = {
--         linters = {
--             eslint = {
--                 command = './node_modules/.bin/eslint',
--                 rootPatterns = { '.git' },
--                 debounce = 100,
--                 args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--                 sourceName = 'eslint',
--                 parseJson = {
--                     errorsRoot = '[0].messages',
--                     line = 'line',
--                     column = 'column',
--                     endLine = 'endLine',
--                     endColumn = 'endColumn',
--                     message = '[eslint] ${message} [${ruleId}]',
--                     security = 'severity'
--                 },
--                 securities = {
--                     [2] = 'error',
--                     [1] = 'warning'
--                 }
--             }
--         },
--         filetypes = {
--             javascript = 'eslint',
--             javascriptreact = 'eslint',
--             typescript = 'eslint',
--             typescriptreact = 'eslint'
--         },
--         formatters = {
--             prettier = {
--                 command = './node_modules/.bin/prettier',
--                 args = { '--stdin-filepath', '%filename' }
--             }
--         }
--         -- formatFiletypes = {
--         --    javascript = 'prettier',
--         --    javascriptreact = 'prettier',
--         --    typescript = 'prettier',
--         --    typescriptreact = 'prettier'
--         -- }
--     }
-- }

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'python', 'css', 'html', 'javascript', 'typescript', 'json' }, -- TODO: add .tsx once available
  highlight = {
    enable = true,
  }
}
