return {
  'andweeb/presence.nvim',
  event = 'BufReadPre',
  enabled = true,
  config = function()
    require('presence').setup {
      log_level = nil,
      main_image = 'neovim',

      -- NOTE: Rich presence text options
      editing_text = 'Editing file %s',
    }
  end,
}
