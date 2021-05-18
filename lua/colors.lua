-- ========== Colorscheme Configurations ==========
local cmd = vim.cmd
local g = vim.g

g.visual_inverse = 1

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

cmd 'colorscheme tokyonight'

if g.colors_name == 'srcery' then
    cmd 'highlight! link Pmenu PmenuThumb'
end

if g.visual_inverse == 1 then
    cmd 'highlight! Visual gui=reverse'
end
