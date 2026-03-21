local global = vim.g
local opt = vim.opt

global.have_nerd_font = true

opt.number = true

opt.mouse = 'a'

opt.showmode = false

-- sync clipboard between os and neovim.
opt.clipboard = 'unnamedplus'

opt.breakindent = true

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = 'yes'

opt.updatetime = 250

opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.inccommand = 'split'

opt.cursorline = true

opt.scrolloff = 10

opt.confirm = true

-- diagnostic settings
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  virtual_text = true,
  virtual_lines = false,

  jump = { float = true },
}
