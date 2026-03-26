return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
  keys = {
    { '<leader>cc', ':DiffviewOpen<CR>', desc = 'Git diff current', silent = true },
    { '<leader>cb', ':DiffviewOpen main...HEAD<CR>', desc = 'Git diff branch', silent = true },
    { '<leader>cx', ':DiffviewClose<CR>', desc = 'Git diff close', silent = true },
  },
}
