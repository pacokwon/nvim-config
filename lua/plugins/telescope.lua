local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local keymap = vim.keymap

telescope.setup {
    defaults = {
        file_sorter = require'telescope.sorters'.get_fzy_sorter,
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        prompt_prefix = ' > ',
        color_devicons = true,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        mappings = {
            i = {
                ["<C-u>"] = function()
                    vim.api.nvim_set_current_line("")
                end,
                ["<C-a>"] = function()
                    vim.api.nvim_win_set_cursor(0, {1, 0})
                end,
                ["<C-d>"] = actions.close,
                ["<C-k>"] = actions.preview_scrolling_up,
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
                ["<C-k>"] = actions.preview_scrolling_up,
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
        file_ignore_patterns = { ".yarn" }
    }
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension("ui-select")

keymap.set('n', 'gfe', function() builtin.lsp_references() end, { silent = true })
keymap.set('n', 'gfb', function() telescope.extensions.file_browser.file_browser() end, { silent = true })
keymap.set('n', '<leader>ff', function()
    local _, ret, _ = require('telescope.utils').get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files({ show_untracked = true })
    else
        builtin.find_files()
    end
end, { silent = true })
keymap.set('n', '<leader>fr', builtin.find_files, { silent = true })
keymap.set('n', '<leader>fb', builtin.buffers, { silent = true })
keymap.set('n', '<leader>ft', function() builtin.grep_string({ search = '' }) end, { silent = true })
keymap.set('n', '<leader>fgb', builtin.git_branches, { silent = true })
keymap.set('n', '<leader>fgs', builtin.git_status, { silent = true })
