return {
  'vyfor/cord.nvim',
  branch = 'master',
  event = 'VeryLazy',
  build = ':Cord update',
  opts = {}, -- calls require('cord').setup()
}
