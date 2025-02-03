local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }

    vim.keymap.set({ 'n', 'x', 'i' }, '<D-M-l>', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "Show documentation in hover window." })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Jump to definition." })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Jump to declaration." })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0, desc = "Jump to implementation." })
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { buffer = 0, desc = "Jump to type definition." })
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = 0, desc = "Jump to signature help." })
    vim.keymap.set(
        "n",
        "gq",
        function() vim.lsp.buf.format({ async = true }) end,
        { buffer = 0, desc = "Jump to signature help." }
    )
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0, desc = "Rename symbol under cursor." })
    vim.keymap.set(
        "n",
        "gr",
        require("telescope.builtin").lsp_references,
        { buffer = 0, desc = "Show references in a Telescope window." }
    )
    -- Diagnostics
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = 0, desc = "Jump to next diagnostic." })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = 0, desc = "Jump to previous diagnostic." })
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = 0, desc = "Show diagnostic information in hover." })


    -- Code Actions
    if vim.lsp.buf.range_code_action then
        vim.keymap.set("x", "<leader>la", vim.lsp.buf.range_code_action, { buffer = 0, desc = "Range code action." })
    else
        vim.keymap.set("x", "<leader>la", vim.lsp.buf.code_action, { buffer = 0, desc = "Code action." })
    end
end)

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
