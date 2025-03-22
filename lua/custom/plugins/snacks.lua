return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    terminal = {
      enabled = true,
      win = {
        position = 'float',
        style = 'terminal',
      },
      inteactive = true,
    },
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
          ██████╗ ██████╗ ███████╗███████╗██████╗ 
          ██╔════╝ ██╔══██╗██╔════╝██╔════╝██╔══██╗
          ██║  ███╗██████╔╝█████╗  █████╗  ██║  ██║
          ██║   ██║██╔══██╗██╔══╝  ██╔══╝  ██║  ██║
          ╚██████╔╝██║  ██║███████╗███████╗██████╔╝
           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝ 
      ]],
      },
    },
    explorer = {
      enabled = true,
      position = 'right',
    },
    indent = { enabled = true },
    input = { enabled = true },
    -- picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>na',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>nh',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<leader>fe',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
    {
      '<M-i>',
      function()
        Snacks.terminal()
      end,
      mode = { 'n', 't' },
      desc = 'Toggle Terminal',
    },
  },
}
