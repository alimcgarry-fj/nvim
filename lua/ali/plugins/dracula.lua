return {
  'Mofiqul/dracula.nvim',
  name = 'dracula',
  opts = {},
  config = function(_, opts)
    require('dracula').setup(opts)
    vim.cmd.colorscheme 'dracula'
  end,
  priority = 1000,
}
