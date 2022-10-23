require("nvim-dap-virtual-text").setup({
    virt_text_win_col = 80,
    highlight_changed_variables = true
})
require'plugins.dap.typescript'

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
