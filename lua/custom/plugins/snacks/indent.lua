return {
  enabled = true,
  priority = 1,
  char = '│',
  animate = {
    enabled = vim.fn.has 'nvim-0.10' == 1,
    style = 'down',
  },
  scope = { char = '│' },
  filter = function(buf)
    return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == '' and vim.bo.filetype == 'yaml'
  end,
}
