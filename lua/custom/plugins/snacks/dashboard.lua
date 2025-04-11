-- Taken from https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md#-examples with little bit of tweaking
return {
  enabled = true,
  pane_gap = 20,
  preset = {
    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
    pick = nil,
    -- Used by the `keys` section to show keymaps.
    -- Set your custom keymaps here.
    -- When using a function, the `items` argument are the default keymaps.
    keys = {
      { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
      { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
      { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
      {
        icon = ' ',
        key = 'c',
        desc = 'Config',
        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
      },
      { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
      { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
    -- Used by the `header` section
    header = [[
███╗   ███╗██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗
████╗ ████║██║████╗  ██║██║   ██║██║████╗ ████║
██╔████╔██║██║██╔██╗ ██║██║   ██║██║██╔████╔██║
██║╚██╔╝██║██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚═╝ ██║██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                                               
]],
  },
  sections = {
    { section = 'header' },
    {
      pane = 2,
      section = 'terminal',
      -- See:
      -- [Derek Taylor / Shell Color Scripts · GitLab](https://gitlab.com/dwt1/shell-color-scripts)
      cmd = 'colorscript -e square',
      height = 5,
      padding = 0,
    },
    { section = 'keys', gap = 1, padding = 1 },
    { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
    { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
    {
      pane = 2,
      icon = ' ',
      title = 'Git Status',
      section = 'terminal',
      enabled = function()
        return Snacks.git.get_root() ~= nil
      end,
      cmd = 'git status --short --branch --renames',
      height = 5,
      padding = 5,
      ttl = 5 * 60,
      indent = 0,
    },
    { section = 'startup' },
  },
}
