return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require'gitsigns'.setup {
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                      opts = opts or {}
                      opts.buffer = bufnr
                      opts.noremap = true
                      vim.keymap.set(mode, l, r, opts)
                    end

                    map('n', ')', "&diff ? ')' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'", {expr = true})
                    map('n', '(', "&diff ? '(' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'", {expr = true})
                    map('n', '<leader>hs', gs.stage_hunk)
                    map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
                    map('n', '<leader>hu', gs.undo_stage_hunk)
                    map('n', '<leader>hx', gs.reset_hunk)
                    map('n', '<leader>hb', gs.blame_line)
                    map('n', '<leader>hp', gs.preview_hunk)
                end,
                current_line_blame = true,
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
            }
        end
    }
}
