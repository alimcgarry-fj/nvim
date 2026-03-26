return { -- fuzzy finder
  'nvim-telescope/telescope.nvim',
  enabled = true,
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = function() return vim.fn.executable 'make' == 1 end },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- :help telescope.builtin
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'find help' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'find keymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = 'find select telescope' })
    vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string, { desc = 'find current word' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'find by grep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'find diagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'find resume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'find recent files ("." for repeat)' })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'find commands' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'find existing buffers' })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
      callback = function(event)
        local buf = event.buf

        -- find references for the word under your cursor.
        vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = 'go to references' })

        -- jump to the implementation of the word under your cursor.
        vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = 'goto implementation' })

        -- jump to the definition of the word under your cursor.
        -- to jump back, press <C-t>.
        vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = 'goto definition' })

        -- fuzzy find all the symbols in your current document.
        vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'open document symbols' })

        -- fuzzy find all the symbols in your current workspace.
        vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'open workspace symbols' })

        -- jump to the type of the word under your cursor.
        vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = 'goto type definition' })
      end,
    })

    -- override default behavior and theme when searching
    vim.keymap.set('n', '<leader>/', function()
      -- you can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '/ fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set(
      'n',
      '<leader>f/',
      function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'live Grep in Open Files',
        }
      end,
      { desc = 'find / in open files' }
    )

    -- shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = 'search neovim files' })
  end,
}
