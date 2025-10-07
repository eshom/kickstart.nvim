-- Not lazy modules
require 'options'
require 'keymap'
require 'autocmd'
require 'lazy-install'

-- Lazy section
require('lazy').setup({
  -- Additional lazy imports
  { import = 'custom.plugins' },
  { import = 'custom' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- default theme
vim.api.nvim_cmd({ cmd = 'colorscheme', args = { 'cyberdream' } }, { output = false })
