lua << EOF
  local project = require'telescope'.load_extension('project')
  -- vim.api.nvim_set_keymap(
  --         'i',
  --         '<C-o>',
  --         ":lua require'telescope'.extensions.project.project{}<CR>",
  --         {noremap = true, silent = true}
  -- )
EOF

