return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "fedepujol/move.nvim",
    lazy = false,
    config = function()
      require('move').setup({
        line = {
          enable = true, -- Enables line movement
          indent = true  -- Toggles indentation
        },
        block = {
          enable = true, -- Enables block movement
          indent = true  -- Toggles indentation
        },
        word = {
          enable = false, -- Enables word movement
        },
        char = {
          enable = false -- Enables char movement
        }
      })
    end
  },
  {
    "cappyzawa/trim.nvim",
    lazy = false,
    config = function()
      require('trim').setup({
        ft_blocklist = {
          'TelescopePrompt',
          'Trouble',
          'help',
          'nvdash',
          'nvcheatsheet',
          'mason',
          'notify',
          'lazy'
        },

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
  {
    "farmergreg/vim-lastplace",
    lazy = false,
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      {'kkharji/sqlite.lua', module = 'sqlite'},
      -- you'll need at least one of these
      {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup({
        default_register = '"',
      })
    end,
  },
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
    "slim-template/vim-slim", lazy = false
  },

  {
    "wakatime/vim-wakatime", lazy = false
  },
}
