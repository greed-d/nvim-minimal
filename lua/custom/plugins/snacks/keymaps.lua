return {

  -- NOTE: [[ Buffer Stuff ]]
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

  -- NOTE: [[ Rename Files ]]
  {
    '<leader>cR',
    function()
      Snacks.rename.rename_file()
    end,
    desc = '[C]ode Rename',
  },

  -- NOTE: [[ Lazy Git ]]
  {

    '<leader>lg',
    function()
      Snacks.lazygit()
    end,
    desc = 'Lazygit',
  },

  -- NOTE: [[ Git Stuff ]]
  {
    'gX',
    function()
      Snacks.gitbrowse()
    end,
    desc = 'Open remote url',
  },
  {
    'gb',
    function()
      Snacks.git.blame_line()
    end,
    desc = 'Git: Blame Line',
  },

  -- NOTE: [[ Notification stuff ]]
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

  -- NOTE: [[ File explorer ]]
  -- FIXME: Some refinement needed
  {
    '\\',
    function()
      if Snacks.picker.get({ source = 'explorer' })[1] == nil then
        Snacks.picker.explorer()
      elseif Snacks.picker.get({ source = 'explorer' })[1]:is_focused() == true then
        Snacks.picker.explorer()
      elseif Snacks.picker.get({ source = 'explorer' })[1]:is_focused() == false then
        Snacks.picker.get({ source = 'explorer' })[1]:focus()
      end
    end,
    desc = 'File Explorer',
  },

  -- NOTE: [[ Terminal ]]
  {
    '<M-i>',
    function()
      Snacks.terminal()
    end,
    mode = { 'n', 't' },
    desc = 'Toggle Terminal',
  },

  -- NOTE: [[ Telescope Replacement ]]
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
    '<leader>ss',
    function()
      Snacks.picker.pickers()
    end,
    desc = 'Pick Pickers',
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
  {
    '<leader>sp',
    function()
      Snacks.picker.projects()
    end,
    desc = 'Projects',
  },

  -- NOTE: [[ TODO Comments ]]
  {
    '<leader>st',
    function()
      Snacks.picker.todo_comments()
    end,
    desc = 'Todo',
  },
  {
    '<leader>sT',
    function()
      Snacks.picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
    end,
    desc = 'Todo/Fix/Fixme',
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
