return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local catppuccin = require 'catppuccin.utils.lualine'
    return {
      options = {
        theme = catppuccin,
      },
    }
  end,
}
