return {
  indent = {
    enabled = true,
    char = '▏',
  },
  scope = {
    enabled = true,
    underline = true,
    char = '▏',
  },
  animate = {
    enabled = false,
  },
  filter = function(buf)
    local b = vim.b[buf]
    local bo = vim.bo[buf]
    local excluded_filetypes = {
      markdown = true,
      text = true,
    }
    return vim.g.snacks_indent ~= false and b.snacks_indent ~= false and bo.buftype == '' and not excluded_filetypes[bo.filetype]
  end,
}
