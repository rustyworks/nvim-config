lua << EOF
  local theme = {
    -- fill = 'TabLineFill',
    fill = { fg='#44475a', bg='#404040'},
    head = { fg='#44475a', bg='#616060', style='bold' },
    current_tab = { fg='#44475a', bg='#f8f8f8', style='bold' },
    tab = { fg='#44475a', bg='#616060' },
    win = { fg='#44475a', bg='#616060', style='bold' },
    tail = { fg='#44475a', bg='#616060', style='bold' },
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
      -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      --   return {
      --     line.sep('', theme.win, theme.fill),
      --     win.is_current() and '' or '',
      --     win.buf_name(),
      --     line.sep('', theme.win, theme.fill),
      --     hl = theme.win,
      --     margin = ' ',
      --   }
      -- end),
      {
        line.sep('', theme.tail, theme.fill),
        { '  ', hl = theme.tail },
      },
      hl = theme.fill,
    }
  end)
  -- vim.o.showtabline = 2
EOF
