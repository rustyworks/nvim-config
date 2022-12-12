lua << EOF
  require('telescope').setup({
    defaults = {
      -- Check at :help telescope.layout
      layout_strategy = "bottom_pane",
      -- sorting_strategy = "ascending",
      layout_config = {
        bottom_pane = {
            height = 0.4,
        },
        -- other layout configuration here
      },
      -- other defaults configuration here
    },
    -- other configuration values here
  })

  require('telescope.builtin').buffers(
    { sort_lastused = true, ignore_current_buffer = true }
  )

  local project = require'telescope'.load_extension('project')
  local actions = require("telescope.actions")

  -- To ensure telescope is closed when we click escape
  require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  })
EOF
