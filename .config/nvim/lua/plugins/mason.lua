return {
    {
      'williamboman/mason.nvim',
      dependencies = {
        'williamboman/mason-lspconfig.nvim'
      },
      config = function(_, opts)
        require("mason").setup(opts)
        require("mason-lspconfig").setup()
      end
    }
}
