return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  dependencies = {
    {
      'folke/todo-comments.nvim',
      opts = { signs = false },
    },
  },
  ---@type snacks.Config
  opts = {
    dashboard = require 'custom.plugins.snacks.dashboard',
    indent = require 'custom.plugins.snacks.indent',
    picker = require 'custom.plugins.snacks.picker',
    terminal = require 'custom.plugins.snacks.terminal',

    image = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    bigfile = { enabled = true },
    explorer = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    words = { enabled = true },
    bufdelete = { enabled = true },

    scroll = { enabled = false },
    dim = { enabled = false },
  },
  keys = require 'custom.plugins.snacks.keymaps',
}
