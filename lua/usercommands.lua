-- Check linter info for current buffer
vim.api.nvim_create_user_command('LintInfo', function()
  local filetype = vim.bo.filetype
  local linters = require('lint').linters_by_ft[filetype]

  if linters then
    print('Linters for ' .. filetype .. ': ' .. table.concat(linters, ', '))
  else
    print('No linters configured for filetype: ' .. filetype)
  end
end, {})
