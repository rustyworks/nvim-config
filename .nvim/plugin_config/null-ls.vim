lua << EOF
  local null_ls = require("null-ls")
  null_ls.setup({
      sources = {
          -- null_ls.builtins.code_actions.refactoring,
          -- null_ls.builtins.code_actions.xo,

          -- null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.flake8.with({
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
          }),
          null_ls.builtins.diagnostics.jshint.with({
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
          }),
          null_ls.builtins.diagnostics.tidy.with({
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
          }),
          -- null_ls.builtins.diagnostics.xo,
          -- null_ls.builtins.diagnostics.yamllint,

          -- null_ls.builtins.diagnostics.sqlfluff.with({
          --     extra_args = { "--dialect", "postgres" }, -- change to your dialect
          -- }),

          -- null_ls.builtins.formatting.isort,
          -- null_ls.builtins.formatting.markdownlint,
      },
  })
EOF
