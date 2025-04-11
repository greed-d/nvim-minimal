vim.env.LAZY_STDPATH = '.repro'
load(vim.fn.system 'curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua')()

require('lazy.minit').repro {
  spec = {
    {
      'folke/snacks.nvim',
      opts = {
        indent = {
          enabled = true,
          priority = 1,
          char = '│',
          animate = {
            enabled = true,
            style = 'out',
            easing = 'linear',
            duration = {
              step = 200, -- ms per step
              total = 500, -- maximum duration
            },
          },
          scope = { char = '│' },
          filter = function(buf)
            return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == '' and vim.bo.filetype == 'yaml'
          end,
        },
      },
    },
    -- add any other plugins here
  },
}
