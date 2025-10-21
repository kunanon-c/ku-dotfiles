return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      highlight = {
        enable = true,
        disable_spell_checking = true,
        disable = { 'go' },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      enable = true,
      max_lines = 0,
      trim_scope = 'outer',
      zindex = 20,
      mode = 'cursor',
      separator = nil,
    },
  },
}
