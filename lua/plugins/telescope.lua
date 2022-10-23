local telescope = require('telescope')
local actions = require('telescope.actions')

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
    },
    extensions = {
        fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension("ui-select")
