local dap = require'dap'

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.local/share/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
    {
        name = 'Debug Node',
        type = 'node2',
        request = 'launch',
        program = '${workspaceFolder}/${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
}
