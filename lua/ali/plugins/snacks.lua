return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      enabled = true,
      sections = {
        {
          section = 'header',
          padding = 1,
          height = 12,
          indent = 2,
        },
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'startup' },
      },
      -- Customizing the buttons and behavior
      preset = {
        header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣠⣤⣤⣤⣤⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣴⠞⠛⠉⠉⠉⠉⠹⠏⠉⠉⠉⠉⠛⠳⣤⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⣷⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣾⣷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⣿⠀⢀⣴⣶⣶⣦⣄⣀⣀⣠⣴⣶⣶⣦⡀⠀⣿⡇⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣄⡀⠋⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠙⢀⣠⡄⠀⠀⠀
⠀⠀⠀⠈⣿⣿⠀⣾⡿⠋⠈⠻⣿⣿⣿⣿⣿⣿⠟⠁⠙⢿⣷⠀⣿⣿⠁⠀⠀⠀
⠀⠀⠀⠀⢿⣿⠀⣿⣦⡴⠛⠀⠈⠻⣿⣿⠟⠁⠀⠛⢦⣴⣿⠀⣿⡿⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠻⠀⣿⣏⣀⣸⣿⣀⣀⣾⣷⣀⣀⣿⣇⣀⣹⣿⠀⠟⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⡀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⣠⣴⣾⣿⣷⣄⠙⣿⣿⣿⣄⡉⢉⣠⣿⣿⣿⠋⣠⣾⣿⣷⣦⣄⡀⠀⠀
⠀⠈⠙⠻⢿⣿⣿⣿⣿⠀⣿⠛⠿⠿⠿⠿⠿⠿⠛⣿⠀⣿⣿⣿⣿⡿⠟⠋⠁⠀
⠀⠀⠀⠀⠀⠙⢿⣿⣿⠀⣿⣷⡄⢠⣤⣤⡄⢠⣾⣿⠀⣿⣿⡿⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠹⣿⡄⠛⠿⢿⣾⣿⣿⣷⣿⠿⠛⢠⣿⠏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠓⠒⠀⠀⠀⠀⠀⠀⠒⠚⠛⠛⠀⠀⠀⠀⠀⠀⠀⠀
        ]],
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ':Telescope find_files' },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ':Telescope oldfiles' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ':Telescope live_grep' },
          { icon = ' ', key = 'c', desc = 'Config', action = ':Telescope find_files cwd=' .. vim.fn.stdpath 'config' },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
    },
  },
  -- This is the "Secret Sauce" that keeps it aligned
  config = function(_, opts)
    local snacks = require 'snacks'

    local dracula = require 'dracula'
    local colors = dracula.colors()

    -- Add the fixed-width padding logic to the buttons dynamically
    for _, key in ipairs(opts.dashboard.preset.keys) do
      key.desc = key.desc .. string.rep(' ', 43 - #key.desc)
    end

    vim.api.nvim_set_hl(0, 'SnacksDashboardKey', { fg = dracula.colors().pink, bg = 'none', bold = true })
    vim.api.nvim_set_hl(0, 'SnacksDashboardDesc', { fg = dracula.colors().bright_white, bg = 'none', bold = true })

    vim.api.nvim_set_hl(0, 'SnacksDashboardIcon', { fg = dracula.colors().bright_white, bg = 'none', bold = true })
    vim.api.nvim_set_hl(0, 'SnacksDashboardIcon', { fg = dracula.colors().bright_white, bg = 'none', bold = true })
    vim.api.nvim_set_hl(0, 'SnacksDashboardFooter', { fg = dracula.colors().white, bg = 'none', bold = true })
    snacks.setup(opts)
  end,
}
