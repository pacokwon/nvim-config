local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' > ',
        color_devicons = true,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        mappings = {
            i = {
                ["<C-u>"] = function()
                    vim.api.nvim_set_current_line("")
                end,
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
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

telescope.load_extension('fzy_native')
