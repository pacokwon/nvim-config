require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        'cssls',
        'eslint',
        'html',
        'tsserver',
    },
    automatic_installation = true,
})

require('mason-null-ls').setup({
    ensure_installed = {
        'prettier'
    },
    automatic_installation = true,
})
