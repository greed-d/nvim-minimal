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
      width = vim.api.nvim_win_get_width(0) - 6,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  -- event = 'BufRead',
  keys = function()
    local keys = {
      {
        'mf',
        function()
          require('harpoon'):list():add()
        end,
        desc = '[M]ark [F]ile to harpoon',
      },
      {
        'ml',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = '[M]ark [L]ist',
      },
    }
    local i = { 'j', 'k', 'l', ';', 5, 6, 7, 8, 9 }

    for key, value in ipairs(i) do
      -- NOTE: Instead of using <C-j,k,l> etc. to switch between window, we're using it to jump around harpoon marks
      if key < 5 then
        table.insert(keys, {
          '<C-' .. value .. '>',
          function()
            require('harpoon'):list():select(key)
          end,
          desc = 'Harpoon to File ' .. key,
        })
      else
        -- If your haproon list is longer than 4 use `<leader>mark_no`
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
