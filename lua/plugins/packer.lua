return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'bfredl/nvim-miniyank'
    use 'editorconfig/editorconfig-vim'
    use 'folke/trouble.nvim'
    use {'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'glepnir/lspsaga.nvim'
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
    use 'junegunn/fzf.vim'
    use 'lewis6991/gitsigns.nvim'
    use 'mattn/emmet-vim'
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-jdtls'
    use 'mhartington/formatter.nvim'
    use 'mrjones2014/nvim-ts-rainbow'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use "nvim-telescope/telescope-file-browser.nvim"
    use 'nvim-telescope/telescope-ui-select.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/playground', requires = 'nvim-treesitter/nvim-treesitter'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'onsails/lspkind.nvim'
    use 'peitalin/vim-jsx-typescript'
    use 'ray-x/lsp_signature.nvim'
    use 'simrat39/rust-tools.nvim'
    use 'windwp/nvim-autopairs'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'tommcdo/vim-exchange'
    use 'tpope/vim-commentary'
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    use 'tpope/vim-fugitive'
    use 'tpope/vim-dadbod'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'

    -- colors
    use 'Shatur95/neovim-ayu'
    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'
    use 'sainnhe/edge'
    use 'srcery-colors/srcery-vim'
end)
