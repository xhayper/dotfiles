--[[ START OF VIM PLUG ]]--

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'wakatime/vim-wakatime'
Plug ('neoclide/coc.nvim', { branch = 'release' })

Plug 'nvim-tree/nvim-web-devicons'
Plug ('akinsho/bufferline.nvim', { tag = 'v3.*' })
Plug ('nvim-treesitter/nvim-treesitter', { ["do"] = ':TSUpdate'})
Plug 'p00f/nvim-ts-rainbow'
Plug ('catppuccin/nvim', { as = 'catppuccin' })

Plug 'lewis6991/gitsigns.nvim'
Plug 'danilamihailov/beacon.nvim'
Plug 'feline-nvim/feline.nvim'

vim.call('plug#end')

--[[ END OF VIM PLUG ]]--

vim.opt.termguicolors = true

require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    sync_install = true,
    auto_install = true,
    highlight = {
        enabled = true
    },
    rainbow = {
        enabled = true,
        extended_mode = true
    }
})

require("catppuccin").setup({
    flavour = "mocha",
    background = {
        light = "mocha",
        dark = "mocha",
    },
    integrations = {
        ["treesitter"] = true,
        ["ts_rainbow"] = true,
        ["gitsigns"] = true
    }
});

local ctp_feline = require('catppuccin.groups.integrations.feline')

ctp_feline.setup({})

require("feline").setup({
    components = ctp_feline.get(),
})
