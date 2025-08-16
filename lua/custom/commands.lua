-- local builtin = require 'telescope.builtin'

return {
  vim.api.nvim_create_user_command('ZlsDevStart', function()
    -- Stop previously auto-started zls clients if using zls-dev
    ---@type string
    local root_dir
    local clients = vim.lsp.get_clients()

    -- But also avoid starting zls-dev multiple times
    local zls_dev_client_id = nil

    for _, value in pairs(clients) do
      if value.name == 'zls' then
        vim.lsp.stop_client(value.id)
        root_dir = value.root_dir
      end

      if value.name == 'zls-dev' then
        zls_dev_client_id = value.id
      end
    end

    -- The correct thing is to attach buffer to existing client
    if zls_dev_client_id ~= nil then
      vim.lsp.buf_attach_client(vim.api.nvim_get_current_buf(), zls_dev_client_id)
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
