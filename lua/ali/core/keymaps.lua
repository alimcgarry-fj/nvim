local global = vim.g
local keymap = vim.keymap

global.mapleader = ' '
global.maplocalleader = ' '

-- end search
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })

-- diagnostics
keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostic [Q]uickfix list' })

-- terminal
keymap.set('n', '<C-t>', '<cmd>split | term<CR>i')
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
