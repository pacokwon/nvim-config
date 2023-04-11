return {
    {
        'glepnir/lspsaga.nvim',
        keys = {
            { 'ga', '<cmd>Lspsaga code_action<CR>', silent = true },
        },
        config = function()
            require'lspsaga'.setup({
                -- use emoji lightbulb in default
                ui = {
                    code_action = "",
                }
            })
        end,
    }
}
