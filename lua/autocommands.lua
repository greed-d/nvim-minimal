-- LSP progress via snacks notifier
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
-- NOTE: View LSP progress in notification, removes fidget.nvim
vim.api.nvim_create_autocmd('LspProgress', {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= 'table' then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ('[%3d%%] %s%s'):format(
            value.kind == 'end' and 100 or value.percentage or 100,
            value.title or '',
            value.message and (' **%s**'):format(value.message) or ''
          ),
          done = value.kind == 'end',
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    vim.notify(table.concat(msg, '\n'), 'info', {
      id = 'lsp_progress',
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
-- Define the names of files or directories that signify a project root.
-- Neovim will search upwards from the current file's directory for these.
local root_markers = { '.git', 'Makefile', 'lazy-lock.lua', '.venv' }
local exrcs = { '.nvim.lua', '.nvimrc', '.exrc' }

-- If there's an exrc file that's trusted at the given path,
-- source it, otherwise return
local read_exrc = function(path)
  if vim.o.exrc == false then
    return
  end

  -- stops on first found, returns table so we index it to get string
  local exrc = vim.fs.find(exrcs, {
    path = path,
    type = 'file',
  })[1] -- string|nil
  if not exrc then
    return
  end

  if vim.secure.read(exrc) then
    vim.cmd.source(exrc)
  end
end

-- Return directory path to start search from
local set_project_root = function()
  local cwd = vim.fn.getcwd()

  local root_marker = vim.fs.find(root_markers, {
    path = cwd,
    upward = true,
  })[1]

  if not root_marker then
    return
  end

  -- otherwise you get root_dir as '/foo/bar/.git', '/foo/bar'
  local root_dir = vim.fs.dirname(root_marker)

  vim.fn.chdir(root_dir)
  read_exrc(root_dir)
end

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('Rooter', {}),
  desc = 'Find project root on BufEnter. cd there and try reading any exrc there.',
  callback = set_project_root,
})
-- local root_names = { '.git', 'Makefile', 'PiPFile', 'manage.py', 'lazy-lock.json' }
--
-- -- Cache to use for speed up (at cost of possibly outdated results)
-- local root_cache = {}
--
-- local set_root = function()
--   -- Get directory path to start search from
--   local path = vim.api.nvim_buf_get_name(0)
--   if path == '' then
--     return
--   end
--   path = vim.fs.dirname(path)
--
--   -- Try cache and resort to searching upward for root directory
--   local root = root_cache[path]
--   if root == nil then
--     local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
--     if root_file == nil then
--       return
--     end
--     root = vim.fs.dirname(root_file)
--     root_cache[path] = root
--   end
--
--   -- Set current directory
--   vim.fn.chdir(root)
-- end
--
-- local root_augroup = vim.api.nvim_create_augroup('MyAutoRoot', {})
-- vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })

vim.o.foldmethod = 'expr'
-- Default to treesitter folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method 'textDocument/foldingRange' then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})

-- Neovim's builtin auto completion
-- vim.o.completeopt = 'menu,menuone,noinsert,popup,fuzzy'

-- vim.o.completeopt = 'menuone,noinsert,popup,fuzzy'
--
-- vim.api.nvim_create_autocmd({
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--
--     if client:supports_method 'textDocument/completion' then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- }, 'LspAttach')
-- vim.o.completeopt = 'menuone,noinsert,popup,fuzzy'
--
-- ---[[ Setup keymaps so we can accept completion using Enter and choose items using arrow keys or Tab.
-- local pumMaps = {
--   ['<Tab>'] = '<C-n>',
--   ['<S-Tab>'] = '<C-p>',
--   ['<Down>'] = '<C-n>',
--   ['<Up>'] = '<C-p>',
--   ['<CR>'] = '<C-y>',
-- }
-- for insertKmap, pumKmap in pairs(pumMaps) do
--   vim.keymap.set('i', insertKmap, function()
--     return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
--   end, { expr = true })
-- end
-- ---]]
--
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     ---[[Code required to activate autocompletion and trigger it on each keypress
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     client.server_capabilities.completionProvider.triggerCharacters = vim.split('qwertyuiopasdfghjklzxcvbnm. ', '')
--     vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
--       buffer = args.buf,
--       callback = function()
--         vim.lsp.completion.get()
--       end,
--     })
--     vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
--     ---]]
--
--     ---[[Code required to add documentation popup for an item
--     local _, cancel_prev = nil, function() end
--     vim.api.nvim_create_autocmd('CompleteChanged', {
--       buffer = args.buf,
--       callback = function()
--         cancel_prev()
--         local info = vim.fn.complete_info { 'selected' }
--         local completionItem = vim.tbl_get(vim.v.completed_item, 'user_data', 'nvim', 'lsp', 'completion_item')
--         if nil == completionItem then
--           return
--         end
--         _, cancel_prev = vim.lsp.buf_request(args.buf, vim.lsp.protocol.Methods.completionItem_resolve, completionItem, function(err, item, ctx)
--           if not item then
--             return
--           end
--           local docs = (item.documentation or {}).value
--           local win = vim.api.nvim__complete_set(info['selected'], { info = docs })
--           if win.winid and vim.api.nvim_win_is_valid(win.winid) then
--             vim.treesitter.start(win.bufnr, 'markdown')
--             vim.wo[win.winid].conceallevel = 3
--           end
--         end)
--       end,
--     })
--     ---]]
--   end,
-- })
-- Virtual lines on current line
vim.api.nvim_create_autocmd({ 'CursorMoved', 'DiagnosticChanged' }, {
  group = vim.api.nvim_create_augroup('diagnostic_virt_text_hide', {}),
  callback = function(ev)
    local lnum, _ = unpack(vim.api.nvim_win_get_cursor(0))
    lnum = lnum - 1 -- need 0-based index

    local hidden_lnum = vim.b[ev.buf].diagnostic_hidden_lnum
    if hidden_lnum and hidden_lnum ~= lnum then
      vim.b[ev.buf].diagnostic_hidden_lnum = nil
      -- display all the decorations if the current line changed
      vim.diagnostic.show(nil, ev.buf)
    end

    for _, namespace in pairs(vim.diagnostic.get_namespaces()) do
      local ns_id = namespace.user_data.virt_text_ns
      if ns_id then
        local extmarks = vim.api.nvim_buf_get_extmarks(ev.buf, ns_id, { lnum, 0 }, { lnum, -1 }, {})
        for _, extmark in pairs(extmarks) do
          local id = extmark[1]
          vim.api.nvim_buf_del_extmark(ev.buf, ns_id, id)
        end

        if extmarks and not vim.b[ev.buf].diagnostic_hidden_lnum then
          vim.b[ev.buf].diagnostic_hidden_lnum = lnum
        end
      end
    end
  end,
})
