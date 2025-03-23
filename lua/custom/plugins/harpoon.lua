return {
  'Theprimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
  end,
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 5,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  -- event = 'BufRead',
  keys = function()
    local keys = {
      {
        '<leader>H',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon File',
      },
      {
        '<leader>h',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        '<leader>' .. i,
        function()
          require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon to File ' .. i,
      })
    end
    return keys
  end,
  -- keys = {
  --   {
  --     'mf',
  --     function() end,
  --     desc = '[M]ark [F]ile',
  --   },
  --   {
  --     'ml',
  --     function()
  --       harpoon.ui:toggle_quick_menu(harpoon:list())
  --     end,
  --     desc = '[M]ark [L]ist',
  --   },
  --   {
  --     '<C-j>',
  --     function()
  --       require('harpoon.ui').nav_file(1)
  --     end,
  --
  --     desc = 'Move to 1st file in list',
  --   },
  --   {
  --     '<C-k>',
  --     function()
  --       require('harpoon.ui').nav_file(2)
  --     end,
  --     desc = 'Move to 2nd file in list',
  --   },
  --   {
  --     '<C-l>',
  --     function()
  --       require('harpoon.ui').nav_file(3)
  --     end,
  --     desc = 'Move to 3rd file in list',
  --   },
  --   {
  --     '<C-h>',
  --     function()
  --       require('harpoon.ui').nav_file(4)
  --     end,
  --     desc = 'Move to 4th file in list',
  --   },
  --   {
  --     'mt',
  --     function()
  --       require('harpoon.ui').nav_file(5)
  --     end,
  --     desc = 'Move to 5th file in the list',
  --   },
  -- },
}
