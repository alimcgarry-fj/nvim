return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  ---@module 'which-key'
  ---@type wk.Opts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    preset = 'helix',
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },

    spec = {
      { '<leader>f', group = 'find', mode = { 'n', 'v' } },
      { '<leader>g', group = 'git', mode = { 'n', 'v' } },
      { '<leader>c', group = 'git diff', mode = { 'n', 'v' } },
      { 'gr', group = 'lsp actions', mode = { 'n' } },
    },
  },
}
