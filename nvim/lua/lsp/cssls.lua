local configs = require("nvchad.configs.lspconfig")

return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  root_markers = { '.git' },
  on_init = configs.on_init,
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = 'ignore',
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = 'ignore',
      },
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
}
