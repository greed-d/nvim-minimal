return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
    need = 1,
  },
  keys = {
    {
      '<leader>qs',
      function()
        require('persistence').load()
      end,
      desc = 'Load session for cwd',
    },
    {
      '<leader>qS',
      function()
        require('persistence').select()
      end,
      desc = 'select a session to load',
    },
    {
      '<leader>ql',
      function()
        require('persistence').load { last = true }
      end,
    },
  },
}
