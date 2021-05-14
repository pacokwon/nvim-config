require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { 'python' }
  },
  ensure_installed = {
      'c',
      'cpp',
      'css',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'latex',
      'lua',
      'python',
      'rust',
      'tsx',
      'typescript',
      'swift',
  }
}
