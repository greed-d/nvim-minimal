return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = require 'custom.plugins.snacks.dashboard',
    indent = require 'custom.plugins.snacks.indent',
    picker = require 'custom.plugins.snacks.picker',
    terminal = {
      enabled = true,
      win = {
        position = 'float',
        style = 'terminal',
      },
      inteactive = true,
    },
    bigfile = { enabled = true },
    explorer = {
      enabled = true,
      position = 'right',
    },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = require 'custom.plugins.snacks.keymaps',
}
