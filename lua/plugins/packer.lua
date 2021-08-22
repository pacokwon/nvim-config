return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'

    use 'akinsho/nvim-toggleterm.lua'
    use 'bfredl/nvim-miniyank'
    use 'editorconfig/editorconfig-vim'
    use {'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'glepnir/lspsaga.nvim'
    use 'hrsh7th/nvim-compe'
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
    use 'junegunn/fzf.vim'
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'lbrayner/vim-rzip'
    use 'leafOfTree/vim-vue-plugin'
    use 'lewis6991/gitsigns.nvim'
    -- use 'ludovicchabant/vim-gutentags'
    use 'mattn/emmet-vim'
    use 'mfussenegger/nvim-dap'
    use 'neovim/nvim-lspconfig'
    use 'neovimhaskell/haskell-vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/playground', requires = 'nvim-treesitter/nvim-treesitter'}
    use 'pacokwon/plink.nvim'
    use 'peitalin/vim-jsx-typescript'
    use 'ray-x/lsp_signature.nvim'
    use 'rust-lang/rust.vim'
    use 'scalameta/nvim-metals'
    use 'steelsojka/pears.nvim'
    use {'styled-components/vim-styled-components', branch = 'develop'}
    use 'tommcdo/vim-exchange'
    use 'tpope/vim-commentary'
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'vifm/vifm.vim'
    use 'vimwiki/vimwiki'

    use 'arzg/vim-colors-xcode'
    use 'folke/tokyonight.nvim'
    use 'haishanh/night-owl.vim'
    use 'mhartington/oceanic-next'
    use 'morhetz/gruvbox'
    use 'navarasu/onedark.nvim'
    use 'pacokwon/onedarkpaco.vim'
    use 'pacokwon/panic.vim'
    use 'projekt0n/github-nvim-theme'
    use 'Shatur95/neovim-ayu'
    use 'savq/melange'
    use 'srcery-colors/srcery-vim'

    use 'glepnir/dashboard-nvim'

end)
