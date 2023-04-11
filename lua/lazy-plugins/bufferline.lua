return {
    {
        'akinsho/bufferline.nvim',
        version = "v2.*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require'bufferline'.setup()
        end,
    }
}
