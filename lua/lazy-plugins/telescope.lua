return {
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
        keys = {
            { 'gfe', function() require('telescope.builtin').lsp_references() end, silent = true },
            { 'gfb', function() require('telescope').extensions.file_browser.file_browser() end, silent = true },
            {
                '<leader>ff',
                function()
                    local builtin = require('telescope.builtin')

                    local _, ret, _ = require('telescope.utils').get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
                    if ret == 0 then
                        builtin.git_files({ show_untracked = true })
                    else
                        builtin.find_files()
                    end
                end,
                silent = true,
            },
            { '<leader>fr', function() require('telescope.builtin').find_files() end, silent = true },
            { '<leader>fb', function() require('telescope.builtin').buffers() end, silent = true },
            { '<leader>ft', function() require('telescope.builtin').grep_string({ search = '' }) end, silent = true },
            { '<leader>fgb', function() require('telescope.builtin').git_branches() end, silent = true },
            { '<leader>fgs', function() require('telescope.builtin').git_status() end, silent = true },
        },
        config = function()
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
                      fuzzy = true,                    -- false will only do exact matching
                      override_generic_sorter = true,  -- override the generic sorter
                      override_file_sorter = true,     -- override the file sorter
                      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    }
                }
            }

            telescope.load_extension('fzf')
            telescope.load_extension('file_browser')
            telescope.load_extension("ui-select")
        end,
    },
}
