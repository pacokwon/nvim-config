require'gitsigns'.setup {
    keymaps = {
        noremap = true,
        buffer = true,

        ['n )'] = { expr = true, "&diff ? ')' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
        ['n ('] = { expr = true, "&diff ? '(' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

        ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <leader>hx'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
        ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    },
    watch_index = {
        interval = 1000
    },
    current_line_blame = true,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    use_internal_diff = true,  -- If luajit is present
}
