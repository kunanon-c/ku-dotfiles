return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    opts = {
      highlight = {
        enable = false,
        disable_spell_checking = true,
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
      patterns = {
        default = {
          'class',
          'function',
          'method',
        },
        go = {
          'func_literal',
          'function_declaration',
          'method_declaration',
        },
      },
      zindex = 20,
      mode = 'cursor',
      separator = nil,
    },
  },
}
