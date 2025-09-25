require("mason").setup({
  ui = {
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = { "html", "cssls", "clangd", "ruby_lsp" },
  automatic_installation = true,
})
