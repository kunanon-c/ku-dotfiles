require('lazy').setup({

  'NMAC427/guess-indent.nvim',
  require 'config.plugins.lsp-config',
  require 'config.plugins.darkearth',
  require 'config.plugins.telescope',
  require 'config.plugins.gitsigns',
  require 'config.plugins.conform',
  require 'config.plugins.blink',
  require 'config.plugins.which-key',
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
