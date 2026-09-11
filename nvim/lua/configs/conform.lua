local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    crystal = { "crystal" },
    json = { "prettier" },
  },
}

require("conform").setup(options)
