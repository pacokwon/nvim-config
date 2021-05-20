require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { 'python' }
  },
  ensure_installed = {
      'c',
      'cpp',
      'css',
      'dockerfile',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'latex',
      'lua',
      'ocaml',
      'python',
      'rust',
      'swift',
      'tsx',
      'typescript',
  }
}
