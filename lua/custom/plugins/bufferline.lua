return {
  'akinsho/bufferline.nvim',
  event = 'BufRead',
  version = '*',
  dependencies = 'DaikyXendo/nvim-material-icon',

  config = function()
    require('bufferline').setup {
      options = {
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
        diagnostics_indicator = function(_, _, diag)
          local icons = {
            Error = ' ',
            Warn = ' ',
          }
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }
  end,
  keys = {
    {
      ']b',
      ':BufferLineCycleNext<CR>',
      desc = 'Next buffer',
      silent = true,
    },
    {
      '[b',
      ':BufferLineCyclePrev<CR>',
      desc = 'Next buffer',
      silent = true,
    },
  },
  -- enabled = false,
}
