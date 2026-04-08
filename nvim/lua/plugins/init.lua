return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true, ignore = false },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
}
