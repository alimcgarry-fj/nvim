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
 ／l、
（ﾟ､ ｡ ７
  l  ~ヽ
      じしf_,)ノ
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

    -- Add the fixed-width padding logic to the buttons dynamically
    for _, key in ipairs(opts.dashboard.preset.keys) do
      key.desc = key.desc .. string.rep(' ', 43 - #key.desc)
    end

    snacks.setup(opts)
  end,
}
