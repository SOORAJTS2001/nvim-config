local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig.configs').foundry_lsp = {
    default_config = {
        name = 'hardhat-lsp',
        cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
        filetypes = { 'solidity' },
        root_dir = require("lspconfig.util").find_git_ancestor,
        single_file_support = true,
    }
}


-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').foundry_lsp.setup({})

lsp.setup()
