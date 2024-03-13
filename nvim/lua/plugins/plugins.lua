return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "cappyzawa/trim.nvim",
    lazy = false,
    config = function()
      require('trim').setup({
        ft_blocklist = { 'TelescopePrompt', 'Trouble', 'help', 'nvdash', 'nvcheatsheet' },

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
