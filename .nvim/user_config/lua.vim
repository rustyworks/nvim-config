" Tree Sitter
lua << EOF
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed =  "all",

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      -- disable = { "c", "rust" },
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = true,
    },

    autotag = {
      enable = true
    },
  }
EOF

"NVimTree
lua << EOF
  -- examples for your init.lua

  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  -- empty setup using defaults
  require("nvim-tree").setup()

  -- OR setup with some options
  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })
EOF

"autopairs
lua << EOF
  require("nvim-autopairs").setup {}
EOF

"commenting
lua << EOF
  require'nvim-treesitter.configs'.setup {
    context_commentstring = {
      enable = true
    }
  }
EOF
lua << EOF
  require('Comment').setup()
EOF

"alpha-nvim
lua << EOF
  -- require'alpha'.setup(require'alpha.themes.startify'.config)

  local dashboard = require("alpha.themes.dashboard")

  local function button(sc, txt, keybind, keybind_opts)
      return dashboard.button(sc, txt, keybind, keybind_opts)
  end

  dashboard.section.header.val = {
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠄⡪⣐⡊⡔⡢⡅⣔⠀⡢⡢⠀⡐⢄⢄⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢔⠀⣖⢼⢼⢼⣸⡲⡽⣕⣙⢐⠵⣵⣲⢬⡠⣇⠄⠅⡀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢄⢢⠊⣲⠃⣮⣮⣫⢧⣳⣳⢯⣳⢯⡷⣯⡳⡫⢇⢹⢳⠏⡀⠢⢂⢖⠈⢂⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡪⢐⣌⡊⡦⣇⢌⣯⢾⣻⡬⣞⢿⢽⣻⣽⣗⡯⡫⡠⠩⢰⢮⡳⣝⢴⣒⣜⢲⢨⠀⡂⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢆⢆⠠⢱⢕⣭⢺⣞⡯⡿⡽⡯⣚⡵⣟⣯⢿⣺⡷⣟⢧⡳⡸⣝⡮⡯⣏⡧⣗⡜⣮⢲⡐⡔⡆⡂⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣑⠪⡦⡅⡣⡻⡮⢷⢽⡬⣗⢏⡯⡪⣎⡓⠕⣛⡽⣝⢞⢑⢱⢩⣳⢽⡳⢵⡽⡯⣟⢮⢧⢳⠣⣣⡂⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣳⠯⠙⠜⡐⡈⠁⠈⠈⢵⡹⠱⡽⣜⣿⣲⣵⣅⠄⣙⢘⢀⡢⣳⡽⣞⣷⡽⠜⣯⢏⠆⠁⢁⠡⠡⠳⠹⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢭⠾⠇⡇⠀⠀⠀⠀⠀⢠⡳⣇⡻⢜⢟⢍⢟⠾⣎⢗⢜⡲⢕⢽⠫⡯⠙⢎⠗⠰⠯⡷⡀⠀⠀⠀⠀⠐⢠⠸⢤⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠑⣼⠅⠀⠀⠀⠀⠀⢀⡾⡪⠀⠀⠈⠀⠁⠂⠀⠈⡙⢌⡢⠈⠊⠀⠀⠈⠀⠀⠀⠁⠑⣧⠀⠀⠀⠐⠀⠈⢚⡆⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣞⢶⢜⣇⠀⢂⢂⠈⢀⡄⣦⠁⠀⠀⡀⠀⠀⠀⠀⠠⢈⠓⠑⡑⠰⠀⠀⠀⠀⠀⠀⠀⠂⣧⣢⡀⠁⢌⠄⠀⣮⢇⠋⡆⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⡄⠀⠑⠝⢮⡻⡷⣖⡶⣖⣞⡇⢿⡁⠀⡂⠠⡈⡀⠀⠠⡨⣄⣰⡄⡴⡈⠀⠀⠄⠠⠀⠀⠀⢀⡷⢸⢎⣶⣴⢲⢿⣝⠔⠘⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⢡⡁⠢⠀⠀⡨⡾⡏⡎⠏⠯⡻⣮⣐⢳⢄⡑⠱⠨⢀⢔⠳⣦⠩⠆⡳⠃⣴⠟⣄⠡⠁⠀⣂⡰⠟⣠⡶⡻⠝⡜⢕⣟⡌⡀⠀⠀⠄⠭⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠂⡀⢐⠫⣯⢗⠦⠀⠀⠀⠜⢽⢫⠟⠏⠟⠗⣾⣙⠈⠚⢿⠀⢅⡢⠘⡗⠍⠑⣹⡻⠻⠽⠾⢟⢷⠻⠂⠀⠀⠁⢑⢡⢲⢂⠈⠀⡖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⣰⣟⢑⣌⠊⠀⠀⠀⠀⠀⢀⡄⡀⠀⠀⠀⠀⠛⠍⠣⡸⡠⠊⠈⢀⠃⠜⠉⠪⠀⠀⠀⠠⢠⣄⠀⠀⠀⠀⠀⠐⢕⢴⠀⢷⠈⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠸⠊⢰⡇⠀⠀⠠⠀⠀⢰⡛⡈⠀⠀⡀⠀⠀⠀⠀⡨⢰⠃⠀⠀⠈⣎⢀⠀⠀⠀⠀⠀⠀⠀⠊⢳⠀⠀⢀⠐⠀⠀⢺⠅⠉⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠌⡀⢷⠀⠑⠠⢁⣰⠁⣮⠀⠀⡄⠢⢀⠀⣠⢪⡶⠃⠀⠀⠀⠀⠘⠮⡅⡄⢐⠄⠁⠐⠀⡡⡲⢑⡀⠠⠨⠂⣀⡝⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⢒⡖⣍⠧⣣⡫⣁⢄⢻⣤⣈⠄⠀⠐⡚⡥⣒⠁⠀⠀⠀⠀⠀⠀⠀⢿⣈⠓⠆⢃⠑⠀⣢⠟⡄⡝⣝⣺⢱⠅⣄⠡⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⣜⠵⡿⣻⣗⣯⢒⣿⣻⣗⣷⣽⢾⣞⠷⣽⣹⡇⠀⠀⠀⠀⠀⠀⢀⠀⣹⣗⣣⢖⢖⢖⢯⢷⣻⣽⣷⠱⣽⡮⣿⢽⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠔⠨⠪⡻⡹⡽⢱⢞⢪⣸⠬⡀⠀⠉⠊⡓⣍⢷⣇⠈⠀⢀⠔⢃⡀⠀⢁⡜⣑⠥⡩⠁⠀⠀⠁⢍⣑⡭⢷⠹⡯⢯⢓⠡⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠌⠂⠂⠑⠨⡚⠋⠫⠊⠒⣔⡀⢰⠀⢯⢾⣹⢝⣕⢜⡔⣜⢈⠍⠨⠀⠈⠄⠠⣐⠌⠊⠓⠻⠕⡉⠂⠉⠃⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠈⡢⠈⠀⢀⠀⠀⡀⠀⣯⠀⢎⢀⣧⡫⢞⠏⠹⡮⣯⢞⣼⣜⠬⣂⠠⡮⠨⣆⠀⢀⠀⡁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠢⠀⠀⠀⡀⠀⠂⢼⠃⡠⢇⢷⠬⠢⡿⢥⣰⡏⢬⣻⠚⢾⡌⠖⠢⡹⡅⠱⡄⠀⠀⡀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠌⠄⢀⣢⠀⠀⠐⠐⠆⠊⢉⠘⡨⠀⠈⣆⠩⠨⡀⠑⠀⠇⠂⠚⡰⢐⠈⠄⠀⠠⠄⠀⡀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠄⣾⠀⠀⡀⠄⠁⢐⣽⢒⢿⡀⣞⡷⡀⠀⠀⠀⠀⣾⡂⠀⠀⢽⠃⠀⠀⢘⣆⠀⡠⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠅⠈⣗⠀⠀⢀⠢⡄⢐⡟⠰⠌⢇⠛⠗⠃⠀⠀⠀⠠⠏⠌⠀⠠⡠⠑⠀⠀⢸⡇⡀⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠄⠈⣷⠰⠀⠠⠀⠈⡀⢅⠰⠖⢼⠃⠦⣗⢺⡳⢸⡓⠀⠪⢉⠂⠀⠠⠀⠀⣾⡃⠀⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠄⠀⠘⠷⣌⠆⠰⢤⣀⠨⠀⠠⡂⢁⠈⠃⠩⢐⢈⢡⠀⠁⠄⡴⢠⠂⢏⢾⠝⠀⠠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠠⢈⠂⢂⠀⢱⡃⠈⠈⡇⠐⡑⢾⡅⣸⡂⡸⡆⢨⠇⢸⣖⠝⠈⡣⠐⠁⣸⠁⡀⠠⠈⠂⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠐⡈⢮⠊⡐⡇⠀⠀⡺⡺⡠⠈⡂⠊⠉⡨⠫⠎⢀⠀⡪⢠⢒⢔⠁⠀⠄⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠈⢑⠮⢆⢆⠃⠁⢢⢝⢎⢕⠨⡀⡤⠈⢊⡂⢰⢱⠁⡊⢆⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠈⠪⡒⡍⠵⡌⡫⢯⢪⢷⠵⣳⡹⣲⠳⢑⠁⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠊⠨⠀⠁⠀⠁⠓⠑⠁⠃⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
}
  dashboard.section.buttons.val = {
    button("e", "  New File", "<CMD>ene!<CR>"),
    button("t", "  Find File", "<CMD>Telescope find_files<CR>"),
    -- button("p", "  Recent Projects ", "<CMD>Telescope projects<CR>"),
    -- button("b", "  Recently Used Files", "<CMD>Telescope oldfiles<CR>"),
    -- button("f", "  Find Word", "<CMD>Telescope live_grep<CR>"),
    button("c", "  Configuration", "<CMD>edit " .. "~/.nvim" .. " <CR>"),
  }
  dashboard.config.layout = {
      dashboard.section.header,
      { type = "padding", val = 0 },
      dashboard.section.buttons,
      { type = "padding", val = 0 },
  }
  require'alpha'.setup(require'alpha.themes.dashboard'.config)
EOF

"tabline START
lua << EOF
  local theme = {
    -- fill = 'TabLineFill',
    fill = { fg='#44475a', bg='#282a36'},
    head = { fg='#44475a', bg='#50fa7b', style='bold' },
    current_tab = { fg='#44475a', bg='#ff79c6', style='bold' },
    tab = { fg='#44475a', bg='#6272a4' },
    win = { fg='#44475a', bg='#ff79c6', style='bold' },
    tail = { fg='#44475a', bg='#50fa7b', style='bold' },
  }
  require('tabby.tabline').set(function(line)
    return {
      {
        { '  ', hl = theme.head },
        line.sep('', theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep('', hl, theme.fill),
          tab.is_current() and '' or '',
          tab.number(),
          tab.name(),
          tab.close_btn(''),
          line.sep('', hl, theme.fill),
          hl = hl,
          margin = ' ',
        }
      end),
      line.spacer(),
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        return {
          line.sep('', theme.win, theme.fill),
          win.is_current() and '' or '',
          win.buf_name(),
          line.sep('', theme.win, theme.fill),
          hl = theme.win,
          margin = ' ',
        }
      end),
      {
        line.sep('', theme.tail, theme.fill),
        { '  ', hl = theme.tail },
      },
      hl = theme.fill,
    }
  end)
EOF
"tabline END

"lualine START
lua << EOF
  -- Eviline config for lualine
  -- Author: shadmansaleh
  -- Credit: glepnir
  local lualine = require('lualine')

  -- Color table for highlights
  -- stylua: ignore
  local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  -- Config
  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = '',
      section_separators = '',
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x ot right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left {
    function()
      return '▊'
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
  }

  ins_left {
    -- mode component
    function()
      return ''
    end,
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
      }
      return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
  }

  ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
  }

  ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
  }

  ins_left { 'location' }

  ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
  }

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  ins_left {
    function()
      return '%='
    end,
  }

  -- ins_left {
  --   -- Lsp server name .
  --   function()
  --     local msg = 'No Active Lsp'
  --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  --     local clients = vim.lsp.get_active_clients()
  --     if next(clients) == nil then
  --       return msg
  --     end
  --     for _, client in ipairs(clients) do
  --       local filetypes = client.config.filetypes
  --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
  --         return client.name
  --       end
  --     end
  --     return msg
  --   end,
  --   icon = ' LSP:',
  --   color = { fg = '#ffffff', gui = 'bold' },
  -- }

  -- Add components to right sections
  ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
  }

  ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
  }

  ins_right {
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
  }

  ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  }

  ins_right {
    function()
      return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
  }

  -- Now don't forget to initialize lualine
  lualine.setup(config)
EOF
"lualine END


" EXPERIMENTAL
lua << EOF
  require("mason").setup()
  require("mason-lspconfig").setup()

  -- require('lspconfig').pyright.setup{}
  -- require('lspconfig').jedi_language_server.setup{}
  -- require('lspconfig').python_lsp_server.setup{}
  -- require('lspconfig').sourcery.setup{}
EOF

" Static Checker
lua << EOF
  local null_ls = require("null-ls")
  null_ls.setup({
      sources = {
          -- null_ls.builtins.code_actions.refactoring,
          -- null_ls.builtins.code_actions.xo,

          -- null_ls.builtins.diagnostics.eslint,
          -- null_ls.builtins.diagnostics.flake8,
          -- null_ls.builtins.diagnostics.jshint,
          -- null_ls.builtins.diagnostics.tidy,
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
