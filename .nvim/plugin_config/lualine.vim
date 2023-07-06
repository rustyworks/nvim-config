lua << EOF
  -- Eviline config for lualine
  -- Author: shadmansaleh
  -- Credit: glepnir
  local lualine = require('lualine')

  -- Color table for highlights
  -- stylua: ignore
  -- local colors = {
  --   bg       = '#404040',
  --   fg       = '#f8f8f8',
  --   yellow   = '#ECBE7B',
  --   cyan     = '#008080',
  --   darkblue = '#081633',
  --   green    = '#98be65',
  --   orange   = '#FF8800',
  --   violet   = '#a9a1e1',
  --   magenta  = '#c678dd',
  --   blue     = '#51afef',
  --   red      = '#ec5f67',
  -- }
  local colors = {
    dark       = '#404040',
    normal     = '#616060',
    light      = '#8f8f8f',
    lightest   = '#f8f8f8',
    highlight  = '#ff8ff8',
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
        normal = { c = { fg = colors.dark, bg = colors.light } },
        inactive = { c = { fg = colors.dark, bg = colors.light } },
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
    color = { fg = colors.dark }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
  }

  ins_left {
    -- mode component
    function()
      return '➣ '
    end,
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.normal,
        i = colors.lightest,
        v = colors.lightest,
        [''] = colors.lightest,
        V = colors.lightest,
        c = colors.lightest,
        no = colors.lightest,
        s = colors.lightest,
        S = colors.lightest,
        [''] = colors.lightest,
        ic = colors.lightest,
        R = colors.lightest,
        Rv = colors.lightest,
        cv = colors.lightest,
        ce = colors.lightest,
        r = colors.lightest,
        rm = colors.lightest,
        ['r?'] = colors.lightest,
        ['!'] = colors.lightest,
        t = colors.lightest,
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
    color = { fg = colors.normal, gui = 'bold' },
  }

  ins_left { 'location' }

  ins_left { 'progress', color = { fg = colors.dark, gui = 'bold' } }

  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = colors.highlight },
      color_warn = { fg = colors.highlight },
      color_info = { fg = colors.normal },
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
    color = { fg = colors.normal, gui = 'bold' },
  }

  ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.normal, gui = 'bold' },
  }

  ins_right {
    'branch',
    icon = '',
    color = { fg = colors.normal, gui = 'bold' },
  }

  ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.normal },
      modified = { fg = colors.normal },
      removed = { fg = colors.normal },
    },
    cond = conditions.hide_in_width,
  }

  ins_right {
    function()
      return '▊'
    end,
    color = { fg = colors.dark },
    padding = { left = 1 },
  }

  -- Now don't forget to initialize lualine
  lualine.setup(config)
EOF
