return {
  'utilyre/barbecue.nvim',
  event = 'LspAttach',
  name = 'barbecue',
  enabled = true,
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'DaikyXendo/nvim-material-icon', -- optional dependency
  },
  opts = {
    config = true,
  },
}
