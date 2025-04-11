return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      event = 'BufReadPre',
    },
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      local ai = require 'mini.ai'
      local spec_treesitter = ai.gen_spec.treesitter
      ai.setup {
        n_lines = 500,
        custom_textobjects = {
          -- This will override default "function call" textobject
          f = spec_treesitter { a = '@function.outer', i = '@function.inner' },
          c = spec_treesitter { a = '@class.outer', i = '@class.inner' },
          i = spec_treesitter { a = '@conditional.outer', i = '@conditional.inner' },
        },
      }
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      -- require('mini.statusline').setup(require 'kickstart.plugins.mini.statusline')
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
