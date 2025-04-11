return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    enabled = true,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = true }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#45475A', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'SnacksPickerTitle', { bg = '#7aa2f7', fg = '#1f2335' })
      vim.api.nvim_set_hl(0, 'SnacksPickerPreview', { bg = '#1a1b26' })
      vim.api.nvim_set_hl(0, 'SnacksPickerList', { bg = '#1a1b26' })
      vim.api.nvim_set_hl(0, 'SnacksPickerListTitle', { bg = '#9ece6a', fg = '#1f2335' })
      vim.api.nvim_set_hl(0, 'SnacksPickerInputTitle', { bg = '#f7768e', fg = '#1f2335' })
      vim.api.nvim_set_hl(0, 'SnacksPickerInputBorder', { bg = '#1a1b26', fg = '#45475a' })
      vim.api.nvim_set_hl(0, 'SnacksPickerInputSearch', { bg = '#f7768e', fg = '#1f2335' })
      vim.api.nvim_set_hl(0, 'SnacksPickerInput', { bg = '#1a1b26' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
