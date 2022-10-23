local home = os.getenv('HOME')
local jdtls = require'jdtls'
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local on_attach = function(client, bufnr)
    print("'" .. client.name .."' language server started");
    vim.lsp.handlers['textDocument/hover'] =  vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] =  vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local function setup_dap()
        jdtls.setup_dap({ hotcodereplace = 'auto' })
        require'jdtls.dap'.setup_dap_main_class_configs()
        print('jdt.ls dap setup complete.')
    end

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>jo', jdtls.organize_imports, { silent = true })
    vim.keymap.set('n', '<F4>', setup_dap, { silent = true })

    -- [[
    require'formatter'.setup {
        filetype = {
            java = {
                function()
                    return {
                        exe = 'java',
                        args = {
                            '--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED',
                            '--add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED',
                            '--add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED',
                            '--add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED',
                            '--add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED',
                            '-jar',
                            home .. '/.local/jars/google-java-format-1.15.0-all-deps.jar',
                            vim.api.nvim_buf_get_name(0)
                        },
                        stdin = true
                    }
                end
            }
        }
    }
    -- ]]
end

local config = {
    cmd = {
        '/opt/homebrew/Cellar/openjdk/18.0.2.1/bin/java',
        '-javaagent:' .. home .. '/.local/jars/lombok-1.18.24.jar',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', '/Library/Java/jdt-language-server-1.8.0/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', '/Library/Java/jdt-language-server-1.8.0/config_mac/',
        '-data', vim.fn.expand('~/.cache/jdtls/') .. workspace_dir,
    },

    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    capabilities = capabilities,
    on_attach = on_attach,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        ['java.format.settings.url'] = home .. "/.config/nvim/language-servers/java-google-formatter.xml",
        ['java.format.settings.profile'] = "GoogleStyle",
        java = {
        }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        extendedClientCapabilities = extendedClientCapabilities,
        bundles = {
            vim.fn.glob(home .. "/workspace/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
        }
    },
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
