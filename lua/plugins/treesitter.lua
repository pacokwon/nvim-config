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
    'query',
    'rust',
    'scala',
    'swift',
    'tsx',
    'typescript',
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
