-- [[ Setting options ]]
-- See `:help o.
local o = vim.opt
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

o.formatoptions:remove { 'r', 'o', 'c' } -- Stop neovim from adding comments to new line

-- For fold stuff
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append { fold = ' ' }

if vim.fn.has 'nvim-0.11' == 1 then
  o.winborder = 'rounded' -- Availabe are "single", "double", "rounded", "solid"
end

-- Make line numbers default
o.number = true

-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Show which line your cursor is on
o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 21

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
o.confirm = true

o.whichwrap:append '<>[]hl'

-- NOTE: This is in options because it's optional, change directory to root of current working buffer
-- Array of file names indicating root directory. Modify to your liking.

-- vim: ts=2 sts=2 sw=2 et
