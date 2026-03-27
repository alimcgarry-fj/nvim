return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'dracula' },
    opts = function()
      local dracula = require 'dracula'
      local colors = dracula.colors()

      return {
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '▓▒░', right = '░▒▓' },
        },
        sections = {
          lualine_a = {
            { 'mode', icons_enabled = true, icon = '' },
          },
          lualine_b = {
            { 'branch', icons_enabled = true, icon = '' },
            {
              'diff',
              symbols = { added = ' ', modified = ' ', removed = ' ' },
              diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
              },
            },
            'diagnostics',
          },
          lualine_c = { 'filename' },
          lualine_x = {
            'searchcount',
            'encoding',
            'filetype',
          },
          lualine_y = {
            {
              'lsp_status',
              color = { bg = colors.orange, fg = colors.black },
              icon = '',
              symbols = { spinner = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' }, done = '' },
            },
          },
          lualine_z = {
            'progress',
            'location',
          },
        },
      }
    end,
  },
}
