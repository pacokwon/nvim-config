return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            require'lualine'.setup({
                options = {
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' }
                }
            })
        end
    }
}
