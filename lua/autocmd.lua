-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Zig .zon syntax highlighting
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead', 'FileType' }, {
  pattern = { '*.zig.zon' },
  desc = 'Syntax highlighting for zig zon files',
  group = vim.api.nvim_create_augroup('zig', { clear = false }),
  callback = function()
    vim.o.filetype = 'zig'
  end,
})

--- Returns existing client id and root dir
---@return { id: integer, root_dir: string }?
local find_zls_id = function()
  local clients = vim.lsp.get_clients()
  for _, value in pairs(clients) do
    if value.name == 'zls' then
      local out = {}
      out.id = value.id
      if value.root_dir == nil then
        return nil
      end
      out.root_dir = value.root_dir
      return out
    end
  end
end

--- Lookup `minimum_zig_version` in `build.zig.zon`. If it doesn't exist
--- or if there is no "dev" contained in the string returns `false`.
--- Otherwise returns `true`
---@param root_dir string
---@return boolean
local is_zig_dev = function(root_dir)
  local build_zig_zon = root_dir .. '/build.zig.zon'
  local zon = io.open(build_zig_zon, 'r')
  if zon == nil then
    return false
  end
  --`build.zig.zon` files are not expected to be big, so reading all to memory is fine.
  ---@type string
  local contents = zon:read '*a'
  local find_dev = contents:find '%.minimum_zig_version.+%d+%.%d+%.%d+-dev'
  zon:close()
  return find_dev ~= nil
end

-- Use `zls-dev` instead of `zls` if `.minimum_zig_version` contains "dev"
vim.api.nvim_create_autocmd({ 'LspAttach' }, {
  desc = 'Use zls-dev automatically if relevant',
  pattern = { '*.zig', '*.zon' },
  group = vim.api.nvim_create_augroup('zig', { clear = false }),
  callback = function()
    local zls_existing = find_zls_id()
    if zls_existing == nil then
      return
    end
    if is_zig_dev(zls_existing.root_dir) then
      -- `ZlsDevStart` also stops zls if it finds it.
      -- Keeping it in case I want to manually run the command
      vim.lsp.stop_client(zls_existing.id)
      vim.api.nvim_cmd({ cmd = 'ZlsDevStart' }, {})
    end
  end,
})
