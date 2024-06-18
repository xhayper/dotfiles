return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      'jonarrien/telescope-cmdline.nvim'
    },
    keys = {
      { ':', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' }
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension('cmdline')
    end,
}
