require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { 'python' }
  },
  ensure_installed = { 'c', 'cpp', 'python', 'css', 'html', 'javascript', 'typescript', 'json', 'tsx', 'jsdoc', 'rust', 'lua' }
}
