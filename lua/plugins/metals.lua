local metals = require 'metals'
local cmd = vim.cmd

metals_config = metals.bare_config
metals_config.init_options.statusBarProvider = 'on'
metals_config.on_attach = function(client, bufnr)
  print("'" .. client.name .."' language server started");
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })
end

cmd [[augroup lsp]]
cmd [[au!]]
cmd [[au FileType scala,sbt lua require'metals'.initialize_or_attach(metals_config)]]
cmd [[augroup end]]
