return {
  -- [[ Buffer Stuff ]]
  {
    '<leader>bk',
    function()
      Snacks.bufdelete()
    end,
  },
  {
    '<leader>bK',
    function()
      Snacks.bufdelete.all()
    end,
  },
  -- [[ Rename Files ]]
  {
    '<leader>cR',
    function()
      Snacks.rename.rename_file()
    end,
    desc = '[C]ode Rename',
  },

  -- [[ Lazy Git ]]
  {

    '<leader>lg',
    function()
      Snacks.lazygit()
    end,
    desc = 'Lazygit',
  },

  -- [[ Notification stuff ]]
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

  -- [[ File exporer ]]
  {
    '<leader>fm',
    function()
      Snacks.explorer()
    end,
    desc = 'File Explorer',
  },

  -- [[ Terminal ]]
  {
    '<M-i>',
    function()
      Snacks.terminal()
    end,
    mode = { 'n', 't' },
    desc = 'Toggle Terminal',
  },

  -- [[ Telescope Replacement ]]
  {
    '<leader>sw',
    function()
      Snacks.picker.grep_word()
    end,
    desc = 'Visual selection or word',
    mode = { 'n', 'x' },
  },
  {
    '<leader>sg',
    function()
      Snacks.picker.grep()
    end,
    desc = 'Grep',
  },
  {
    '<leader>sn',
    function()
      Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
    end,
    desc = 'Find Config File',
  },
  {
    '<leader>sf',
    function()
      Snacks.picker.files()
    end,
    desc = 'Find Files',
  },
  {
    '<leader>sh',
    function()
      Snacks.picker.help()
    end,
    desc = 'Search Help Pages',
  },
  {
    '<leader>sH',
    function()
      Snacks.picker.highlights()
    end,
    desc = 'Highlights',
  },
  {
    '<leader>sk',
    function()
      Snacks.picker.keymaps()
    end,
    desc = 'Search Keymaps',
  },
  {
    '<leader>s.',
    function()
      Snacks.picker.recent()
    end,
    desc = 'Recent',
  },
  {
    '<leader>sc',
    function()
      Snacks.picker.colorschemes()
    end,
    desc = 'Colorschemes',
  },

  -- NOTE: LSP stuff from down here
  {
    'gd',
    function()
      Snacks.picker.lsp_definitions()
    end,
    desc = 'Goto Definition',
  },
  {
    'gD',
    function()
      Snacks.picker.lsp_declarations()
    end,
    desc = 'Goto Declaration',
  },
  {
    'gr',
    function()
      Snacks.picker.lsp_references()
    end,
    nowait = true,
    desc = 'References',
  },
  {
    'gI',
    function()
      Snacks.picker.lsp_implementations()
    end,
    desc = 'Goto Implementation',
  },
  {
    'gy',
    function()
      Snacks.picker.lsp_type_definitions()
    end,
    desc = 'Goto T[y]pe Definition',
  },
  {
    '<leader>ds',
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = 'LSP Symbols',
  },
  {
    '<leader>ws',
    function()
      Snacks.picker.lsp_workspace_symbols()
    end,
    desc = 'LSP Workspace Symbols',
  },
}
