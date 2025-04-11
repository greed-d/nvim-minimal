return {
  'nvim-lualine/lualine.nvim',

  dependencies = {
    'DaikyXendo/nvim-material-icon',
    'greed-d/lualine-so-fancy.nvim',
  },
  event = 'VeryLazy',
  enabled = true,
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = ' '
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  -- config = function()
  --   require("custom.plugins.configs.lualine")
  -- end
  opts = {
    options = {
      theme = 'tokyonight',
      component_separators = { right = '', left = '' },
      section_separators = { right = '', left = '' },
      globalstatus = true,
      refresh = {
        statusline = 100,
      },
    },
    sections = {
      lualine_a = {
        { 'fancy_mode', separator = { left = '', right = '' }, right_padding = 2 },
      },
      lualine_b = {
        { 'fancy_branch', icon = '', separator = { left = '', right = '' } },
      },
      lualine_c = {
        {
          'fancy_diff',
          symbols = {
            added = ' ',
            modified = ' ',
            removed = ' ',
          }, -- Changes the symbols used by the diff.
          colored = true,
        },
        { 'fancy_searchcount' },
      },
      lualine_x = {
        { 'fancy_macro', fg = '#474853', bg = '#ee6d85', separator = { left = '', right = '' } },

        {
          'fancy_location',
          separator = { left = '' },
        },
        {
          'fancy_diagnostics',
          -- diagnostics_color = {
          --   error = { fg = '#ee6d85' },
          -- },
          symbols = { error = ' ', warn = ' ', info = '󰋼 ', hint = '󰛩 ' },
        },
      },
      lualine_y = {
        { 'fancy_lsp_servers', separator = { left = '' } },

        -- separator = { left = ''}
      },
      lualine_z = {
        { 'fancy_cwd', fg = '', bg = '#474853', separator = { left = '', right = '' } },

        -- function()
        --   local cwd = vim.fn.getcwd()
        --   return '󰉖 ' .. (cwd:match '([^/\\]+)[/\\]*$' or cwd)
        -- end,
      },
    },
    extensions = {
      'oil',
      'neo-tree',
      'lazy',
      'overseer',
      'mason',
      'man',
      -- require('custom.plugins.snacks.lualine').lualine_custom,
      'trouble',
      {
        sections = {
          lualine_a = {
            function()
              return ' Lazygit'
            end,
          },
          lualine_b = { 'branch' },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        filetypes = { 'lazygit' },
      },
      require 'custom.plugins.snacks.lualine',
    },
  },
}
