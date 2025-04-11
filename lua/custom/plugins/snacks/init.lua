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
    statuscolumn = require 'custom.plugins.snacks.statuscolumn',

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
  config = function(_, opts)
    -- NOTE: Changing from `mini.icons` to `nvim-material-icon`
    -- Delete the config section or Comment out the code to use `mini.icons`

    require('snacks').setup(opts)
    Snacks.util.icon = function(name, cat, opts)
      opts = opts or {}
      local Icons = require 'nvim-web-devicons'
      if cat == 'filetype' then
        return Icons.get_icon_by_filetype(name, { default = true })
      elseif cat == 'directory' then
        return '󰉋 ', 'Directory'
      elseif cat == 'file' then
        local ext = name:match '%.(%w+)$'
        return Icons.get_icon(name, ext, { default = true })
      elseif cat == 'extension' then
        return Icons.get_icon(nil, name, { default = true })
      end

      -- Example with `nvim-material-icon`:
      return require('nvim-web-devicons').get_icon(name, cat, { default = true })
    end

    -- vim.api.nvim_set_hl(0, 'SnacksPickerBorder', { bg = '#0f1016', fg = '#45475a' })
    -- vim.api.nvim_set_hl(0, 'SnacksPickerInputBorder', { bg = '#45475a' })
  end,
  keys = require 'custom.plugins.snacks.keymaps',
}
