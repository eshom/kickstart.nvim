local builtin = require 'telescope.builtin'

return {
  -- Grep to quickfix

  vim.api.nvim_create_user_command('Grep', function(args)
    local rg_out = vim.fn.systemlist('rg ' .. '--vimgrep ' .. args.args)
    vim.fn.setqflist({}, ' ', { lines = rg_out, title = 'Grep results' })
    builtin.quickfix()
  end, { nargs = '*', desc = 'RipGrep working directory and open result in quickfix list' }),

  vim.api.nvim_create_user_command('ZlsDevStart', function()
    -- Stop auto-started zls clients if using zls-dev
    local clients = vim.lsp.get_clients()
    for _, value in pairs(clients) do
      if value.name == 'zls' then
        vim.lsp.stop_client(value.id)
      end
    end
    vim.lsp.start {
      name = 'zls-dev',
      cmd = { 'zls-dev' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'build.zig', 'build.zig.zon' }, { upwards = true, stop = vim.loop.os_homedir() })[1]),
      settings = {
        zls = {
          zig_exe_path = '/home/erez/.local/bin/zig-dev',
          zig_lib_path = '/home/erez/.local/bin/zigup-internal/bin/master/files/lib',
          enable_argument_placeholders = false,
        },
      },
    }
  end, { desc = 'Start ZLS development version LSP' }),
}
