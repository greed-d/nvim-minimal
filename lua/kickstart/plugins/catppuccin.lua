return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'catppuccin/nvim',
    enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('catppuccin').setup {
        flavour = 'mocha', -- possible "latte", "frappe", "macchiato", "mocha"
      }
      -- Setting color scheme
      vim.cmd.colorscheme 'catppuccin'

      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#45475A', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'SnacksPickerBorder', { bg = '#181825', fg = '#45475A' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
