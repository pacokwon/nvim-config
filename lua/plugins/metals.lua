local cmd = vim.cmd

metals_config = require'metals'.bare_config
metals_config.init_options.statusBarProvider = 'on'

cmd [[augroup lsp]]
cmd [[au!]]
cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
cmd [[augroup end]]
