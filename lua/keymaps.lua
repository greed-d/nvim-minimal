-- [[ Basic Keymaps ]]
--  See `:help map()`
local map = vim.keymap.set
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Use Alt-j,k to move line up or down
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Code Stuff
map('n', '<leader>co', ':PyrightOrganizeImports<CR>', { desc = 'Organize Imports for python file', silent = true })
vim.keymap.set('n', '<leader>k', function()
  vim.diagnostic.config { virtual_lines = { current_line = true }, virtual_text = false }

  vim.api.nvim_create_autocmd('CursorMoved', {
    group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
    callback = function()
      vim.diagnostic.config { virtual_lines = false, virtual_text = true }
      return true
    end,
  })
end)
-- Use Alt-. or Alt-, to change size of window
map({ 'n', 'v', 't', 'x' }, '<A-,>', '<C-w><', { desc = 'Decrease window size' })
map({ 'n', 'v', 't', 'x' }, '<A-.>', '<C-w>>', { desc = 'Move indent left once' })
map({ 'i', 's' }, '<C-k>', function()
  vim.lsp.buf.hover { border = 'rounded' }
end)

-- use gj and gk to wrap around lines
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
-- Diagnostic keymaps
vim.keymap.set('i', '<M-l>', function()
  vim.lsp.buf.signature_help { border = 'rounded' }
end, { buffer = bufnr })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Useful everyday keybinds
map('x', 'p', 'p:let @"=@0<CR>', { silent = true })
map('n', '<S-CR>', 'O<Esc>', { desc = 'Add new line above' })
map('n', '<CR>', 'o<Esc>', { desc = 'Add new line below' })
map('n', '<C-s>', '<cmd>w<CR>', { desc = 'file save' })
map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'file copy whole' })
-- map('n', '<C-d>', '<C-d>zz', { desc = 'bring screen to middle' })
-- map('n', '<C-u>', '<C-u>zz', { desc = 'bring screen to middle' })

-- Buffer Stuff
map('n', '<leader>bn', '<cmd>enew<CR>', { desc = 'close buffers' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', 'K', function()
  vim.lsp.buf.hover { border = 'rounded' }
end, { desc = 'hover on' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Undotree
map('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { desc = '[U]ndo Tree Toggle' })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- open virtual lines when jumping diagnostics
---@param jumpCount number
-- local function jumpWithVirtLineDiags(jumpCount)
--   pcall(vim.api.nvim_del_augroup_by_name, 'jumpWithVirtLineDiags') -- prevent autocmd for repeated jumps
--
--   vim.diagnostic.jump { count = jumpCount }
--
--   local initialVirtTextConf = vim.diagnostic.config().virtual_text
--   vim.diagnostic.config {
--     virtual_text = false,
--     virtual_lines = { current_line = true },
--   }
--
--   vim.defer_fn(function() -- deferred to not trigger by jump itself
--     vim.api.nvim_create_autocmd('CursorMoved', {
--       desc = 'User(once): Reset diagnostics virtual lines',
--       once = true,
--       group = vim.api.nvim_create_augroup('jumpWithVirtLineDiags', {}),
--       callback = function()
--         vim.diagnostic.config { virtual_lines = false, virtual_text = initialVirtTextConf }
--       end,
--     })
--   end, 1)
-- end
--
-- vim.keymap.set('n', ']d', function()
--   jumpWithVirtLineDiags(1)
-- end, { desc = '󰒕 Next diagnostic' })
-- vim.keymap.set('n', '[d]', function()
--   jumpWithVirtLineDiags(-1)
-- end, { desc = '󰒕 Prev diagnostic' })
-- vim: ts=2 sts=2 sw=2 et
