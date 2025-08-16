-- local builtin = require 'telescope.builtin'

return {
  vim.api.nvim_create_user_command('ZlsDevStart', function()
    -- Stop previously auto-started zls clients if using zls-dev
    ---@type string
    local root_dir
    local clients = vim.lsp.get_clients()

    -- But also avoid starting zls-dev multiple times
    local zls_dev_found = false

    for _, value in pairs(clients) do
      if value.name == 'zls' then
        vim.lsp.stop_client(value.id)
        root_dir = value.root_dir
      end

      if value.name == 'zls-dev' then
        zls_dev_found = true
      end
    end

    if zls_dev_found then
      return
    end

    vim.lsp.start {
      name = 'zls-dev',
      cmd = { 'zls-dev' },
      root_dir = root_dir,
      settings = {
        zls = {
          -- zig_exe_path = '/home/erez/.local/bin/zig-dev',
          -- zig_lib_path = '/home/erez/.local/share/zigup/master/files/lib',
          zig_exe_path = '/home/erez/src/zig/build/stage3/bin/zig',
          zig_lib_path = '/home/erez/src/zig/build/stage3/lib/zig',
          enable_argument_placeholders = false,
        },
      },
    }
  end, { desc = 'Start ZLS development version LSP' }),
}
