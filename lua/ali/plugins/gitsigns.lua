return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  ---@module 'gitsigns'
  ---@type Gitsigns.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    signs = {
      add = { text = '+' }, ---@diagnostic disable-line: missing-fields
      change = { text = '~' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
    },
    current_line_blame = true,
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })

      -- Actions
      -- visual mode
      map('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git stage hunk' })
      map('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git reset hunk' })
      -- normal mode
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'git stage hunk' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'git reset hunk' })
      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'git stage buffer' })
      map('n', '<leader>gu', gitsigns.stage_hunk, { desc = 'git undo stage hunk' })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'git reset buffer' })
      map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'git preview hunk' })
      map('n', '<leader>gb', gitsigns.blame_line, { desc = 'git blame line' })
      map('n', '<leader>gd', gitsigns.diffthis, { desc = 'git diff against index' })
      map('n', '<leader>gD', function() gitsigns.diffthis '@' end, { desc = 'git diff against last commit' })
      -- Toggles
      map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'toggle git show blame line' })
      map('n', '<leader>gD', gitsigns.preview_hunk_inline, { desc = 'toggle git show deleted' })
    end,
  },
}
