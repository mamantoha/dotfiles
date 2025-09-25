local configs = require("nvchad.configs.lspconfig")

return {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_markers = { '.git', 'compile_commands.json', 'compile_flags.txt', '.clangd' },
  on_init = configs.on_init,
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  settings = {
    clangd = {
      fallbackFlags = { '-std=c++17' },
    },
  },
}
