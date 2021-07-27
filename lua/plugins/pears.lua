require 'pears'.setup(function(conf)
    conf.on_enter(function(pear_handle)
        if vim.fn.pumvisible() == 1  and vim.fn.complete_info().selected ~= -1 then
            vim.api.nvim_feedkeys(vim.fn["compe#confirm"]("<CR>"), "n", true)
        else
            pear_handle()
        end
    end)
end)
