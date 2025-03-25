return {
  'Theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 6,
    },
    settings = {
      save_on_toggle = true,
    },
  },
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

    local i = { 'j', 'k', 'l', ';', 5, 6, 7, 8, 9 }

    for key, value in ipairs(i) do
      if key < 5 then
        table.insert(keys, {
          '<C-' .. value .. '>',
          function()
            require('harpoon'):list():select(key)
          end,
          desc = 'Harpoon to File ' .. key,
        })
      else
        table.insert(keys, {
          '<leader>' .. value,
          function()
            require('harpoon'):list():select(key)
          end,
          desc = 'Harpoon to File ' .. key,
        })
      end
    end
    return keys
  end,
}
