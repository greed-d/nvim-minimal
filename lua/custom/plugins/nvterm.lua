return {
  'NvChad/nvterm',
  -- event = 'BufReadPre',
  config = function()
    require('nvterm').setup {
      terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
          float = {
            relative = 'editor',
            row = 0.05,
            col = 0.07,
            width = 0.85,
            height = 0.8,
            border = 'single',
          },
          horizontal = { location = 'rightbelow', split_ratio = 0.3 },
          vertical = { location = 'rightbelow', split_ratio = 0.5 },
        },
      },
      behavior = {
        autoclose_on_quit = {
          enabled = false,
          confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
      },
    }
  end,
  keys = {
    {
      '<M-b>',
      function()
        local terminal = require 'nvterm.terminal'
        local file = vim.fn.expand '%'
        local sfile = vim.fn.expand '%:r'
        local ft_cmds = {
          sh = 'bash ' .. file,
          rust = 'cargo ' .. file,
          python = 'python3 ' .. file,
          javascript = 'node ' .. file,
          java = 'javac ' .. file .. ' && java ' .. sfile,
          go = 'go build && go run ' .. file,
          c = 'g++ ' .. file .. ' -o ' .. sfile .. ' && ./' .. sfile,
          cpp = 'g++ ' .. file .. ' -o ' .. sfile .. ' && ./' .. sfile,
          typescript = 'deno compile ' .. file .. ' && deno run ' .. file,
        }

        -- Save current buffer
        local current_bufnr = vim.fn.bufnr '%'
        vim.cmd 'w'

        -- Open terminal and run command
        terminal.send(ft_cmds[vim.bo.ft], 'float')

        -- Focus back to terminal window
        vim.cmd 'wincmd p'
      end,
      desc = 'Run current file in floating terminal',
    },
    -- {
    --   '<M-i>',
    --   function()
    --     require('nvterm.terminal').toggle 'float'
    --   end,
    --   mode = { 'n', 't' },
    --   desc = 'Open floating terminal',
    -- },
    {
      '<M-h>',
      function()
        require('nvterm.terminal').toggle 'horizontal'
      end,
      mode = { 'n', 't' },
      desc = 'Open horizontal terminal',
    },
  },
}
