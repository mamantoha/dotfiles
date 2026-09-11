local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    crystal = { "crystal" },
  },
}

require("conform").setup(options)
