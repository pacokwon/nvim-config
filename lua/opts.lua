-- ========== Editor Configurations ==========
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.expandtab = true -- Expands tabs to space
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.backspace = { 'indent', 'eol', 'start' }
opt.wildmenu = true
opt.list = true
opt.listchars = { eol = '¬', tab = '⍿ ', space = ' ', trail = '␠', nbsp = '⎵' }
opt.foldmethod = 'manual'
opt.lazyredraw = true -- improves macro speed
opt.hidden = true
opt.completeopt = { 'menuone', 'noselect' }

-- search related stuff
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = 'split'
opt.ignorecase = true
opt.smartcase = true

-- enable mouse
opt.mouse = 'a'
-- block cursor; also reduces latency
opt.guicursor = {}

opt.formatoptions:remove('a')    -- No autoformatting
opt.formatoptions:append('c')    -- Respect textwidth
opt.formatoptions:append('r')    -- Do continue on enter

opt.wrap = false
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8
opt.updatetime = 500

if vim.fn.has('clipboard') then
    opt.clipboard = 'unnamedplus'
end
