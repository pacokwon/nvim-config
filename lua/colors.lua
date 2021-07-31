-- ========== Colorscheme Configurations ==========
local cmd = vim.cmd
local g = vim.g

g.visual_inverse = true

-- ====== vim-solarized8 ======
g.solarized_visibility = 'high'
g.solarized_extra_hi_groups = true

-- ====== gruvbox ======
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_contrast_light = 'soft'

-- ====== srcery ======
g.srcery_italic = true
g.srcery_inverse_matches = true

-- ====== OceanicNext ======
g.oceanic_next_terminal_bold = true
g.oceanic_next_terminal_italic = true

-- ====== Ayu ======
g.ayucolor = 'light'

-- ====== tokyonight ======
g.tokyonight_transparent = false
g.tokyonight_style = 'storm'

-- ====== onedark ======
g.onedark_style = 'dark'

-- ====== onedark ======
g.ayu_mirage = true

cmd 'colorscheme tokyonight'

if g.visual_inverse then
    cmd 'highlight! Visual gui=reverse'
end
