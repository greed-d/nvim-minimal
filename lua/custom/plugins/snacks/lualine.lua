local function get_statusline()
  local filetype = vim.bo.filetype
  local title = filetype
  local meta = ''

  local snacks_ok, Snacks = pcall(require, 'snacks')

  if filetype == 'snacks_terminal' then
    title = ' Terminal' -- Requires Nerd Font
    meta = vim.fn.expand('%:t'):match '.*:(%S+)$' or vim.fn.expand '%:t'
  elseif filetype == 'snacks_picker_list' then
    title = '🍿 Explorer' -- Requires Nerd Font
    local picker = snacks_ok and Snacks.picker.get()[1] or nil
    if picker and picker.dir then
      meta = vim.fn.fnamemodify(picker:dir(), ':~')
    else
      meta = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
    end
  elseif filetype == 'snacks_picker_input' then
    title = '🍿 Picker' -- Requires Nerd Font
    local picker = snacks_ok and Snacks.picker.get()[1] or nil
    if picker and picker.input and picker.items then
      local input = picker.input:get() or ''
      local count = #picker:items()
      meta = input ~= '' and (' ' .. input .. ': ' .. count .. ' results') or (count .. ' results') -- Requires Nerd Font
    else
      meta = ''
    end
  end

  return title, meta
end

-- Define the custom extension table
local lualine_custom_snacks = {
  sections = {
    lualine_a = {
      function()
        local title, _ = get_statusline()
        return title
      end,
    },
    lualine_b = {
      function()
        local _, meta = get_statusline()
        return meta
      end,
    },
    lualine_c = { '' },
    lualine_x = { '' },
    lualine_y = { '' },
    lualine_z = { '' },
  },
  inactive_sections = {
    lualine_a = {
      function()
        local title, _ = get_statusline()
        return title
      end,
    },
    lualine_b = { '' },
    lualine_c = { '' },
    lualine_x = { '' },
    lualine_y = { '' },
    lualine_z = { '' },
  },
  filetypes = {
    'snacks_picker_input',
    'snacks_picker_list',
    'snacks_terminal',
  },
}

-- IMPORTANT: Return the extension table from this module
return lualine_custom_snacks
