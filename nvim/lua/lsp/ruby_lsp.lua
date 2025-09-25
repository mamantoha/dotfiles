local configs = require("nvchad.configs.lspconfig")

return {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby' },
  root_markers = { '.git', 'Gemfile', '.ruby-version' },
  on_init = configs.on_init,
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  settings = {
    rubyLsp = {
      enabledFeatures = {
        'codeActions',
        'diagnostics',
        'documentHighlights',
        'documentLink',
        'documentSymbols',
        'foldingRanges',
        'formatting',
        'hover',
        'inlayHint',
        'onTypeFormatting',
        'selectionRanges',
        'semanticHighlighting',
        'completion',
        'codeLens',
        'definition',
        'workspaceSymbol',
        'signatureHelp',
        'typeHierarchy',
      },
      rubyVersion = '3.2',
    },
  },
}
