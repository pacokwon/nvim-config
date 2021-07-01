local metals = require'metals'
local cmd = vim.cmd

metals_config = metals.bare_config
metals_config.init_options.statusBarProvider = 'on'
metals_config.on_attach = function(client, bufnr)
  print("'" .. client.name .."' language server started");
end

cmd [[augroup lsp]]
cmd [[au!]]
cmd [[au FileType scala,sbt lua require'metals'.initialize_or_attach(metals_config)]]
cmd [[augroup end]]
