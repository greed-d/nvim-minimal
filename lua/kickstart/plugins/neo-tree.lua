-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'DaikyXendo/nvim-material-icon', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  -- keys = {
  --   { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  -- },
  opts = {
    filesystem = {
      window = {
        position = 'right',
        width = 30,
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
