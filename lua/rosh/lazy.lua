local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require('lazy').setup({

    --Tree
    "nvim-tree/nvim-tree.lua",


    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    --Lsp Setup
    'arkav/lualine-lsp-progress',
    'hrsh7th/cmp-path',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },

    -- Terminal
    { 'akinsho/toggleterm.nvim',         version = "*",      config = true },

    --Status Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Colorscheme
    --
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    --
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    { 'rebelot/kanagawa.nvim' },
    "xiyaowong/transparent.nvim",

    -- Comment
    "terrortylor/nvim-comment",

    --Autobrackets
    "windwp/nvim-autopairs",

    'junegunn/vim-easy-align',
    'averms/black-nvim',



})

-- vim.cmd [[colorscheme tokyonight]]
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme tokyonight]])
