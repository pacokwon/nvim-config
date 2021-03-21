-- ========== Colorscheme Configurations ==========
local cmd = vim.cmd
local g = vim.g

-- ====== vim-solarized8 ======
g.solarized_visibility = 'high'
g.solarized_extra_hi_groups = 1

-- ====== gruvbox ======
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_contrast_light = 'soft'

-- ====== srcery ======
g.srcery_italic = 1
g.srcery_inverse_matches = 1

-- ====== OceanicNext ======
g.oceanic_next_terminal_bold = 1
g.oceanic_next_terminal_italic = 1

cmd 'colorscheme srcery'

if g.colors_name == 'srcery' then
    cmd 'highlight! link Pmenu PmenuThumb'
end
