-- ========== Colorscheme Configurations ==========
local cmd = vim.cmd
local g = vim.g

g.visual_inverse = true

-- ====== gruvbox ======
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_contrast_light = 'soft'

-- ====== srcery ======
g.srcery_italic = true
g.srcery_inverse_matches = true

-- ====== tokyonight ======
g.tokyonight_transparent = false
g.tokyonight_style = 'storm'

-- ====== onedark ======
g.onedark_style = 'dark'

cmd 'colorscheme tokyonight-night'

cmd 'hi! link LineNr StatusLine'

if g.visual_inverse then
    cmd 'highlight! Visual guifg=NONE guibg=NONE gui=reverse'
end
