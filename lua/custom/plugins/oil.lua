return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  opts = {},
  keymaps = {
    ['<C-h>'] = false,
  },

  keys = {

    {
      '-',
      ':Oil<CR>',
      desc = 'Open Oil',
    },
  },
  -- Optional dependencies
  dependencies = { 'DaikyXendo/nvim-material-icon' },
}
