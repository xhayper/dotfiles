return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jonarrien/telescope-cmdline.nvim",
    },
    keys = {
      { ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("cmdline")
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = false,
      },
    },
  },
}
