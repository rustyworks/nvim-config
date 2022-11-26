lua << EOF
  require("mason").setup()
  require("mason-lspconfig").setup()

  -- require('lspconfig').pyright.setup{}
  -- require('lspconfig').jedi_language_server.setup{}
  -- require('lspconfig').python_lsp_server.setup{}
  -- require('lspconfig').sourcery.setup{}
EOF

