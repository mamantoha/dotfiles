local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "RRethy/nvim-treesitter-endwise",
    event = "InsertEnter",
    config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
          enable = true,
        },
      }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    -- "cappyzawa/trim.nvim",
    "mamantoha/trim.nvim",
    lazy = false,
    branch = 'highlight',
    config = function()
      require('trim').setup({
        ft_blocklist = { 'TelescopePrompt', 'Trouble', 'help' },

        patterns = {
          [[%s/\(\n\n\)\n\+/\1/]], -- replace multiple blank lines with a single line
        },

        trim_on_write = true,
        highlight = true
      })
    end
  },
  {
    "lewis6991/fileline.nvim",
    lazy = false,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "vim-crystal/vim-crystal", lazy = false
  },
  {
    "mityu/vim-applescript", lazy = false
  },

  {
    "kchmck/vim-coffee-script", lazy = false
  },
  {
    "isaacsloan/vim-slang", lazy = false
  },
  {
    "wakatime/vim-wakatime", lazy = false
  },
}

return plugins
