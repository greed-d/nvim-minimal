return {
  'nvimdev/indentmini.nvim',
  event = 'BufRead',
  config = function()
    require('indentmini').setup {
      char = '│',
      -- Colors are applied automatically based on user-defined highlight groups.
      -- There is no default value.
      vim.cmd.highlight 'IndentLine guifg=#545560',
      -- Current indent line highlight
      vim.cmd.highlight 'IndentLineCurrent guifg=#A0A8CD',
    }
  end,
}
