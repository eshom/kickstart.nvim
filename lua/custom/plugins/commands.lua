local builtin = require 'telescope.builtin'

return {
  -- Grep to quickfix

  vim.api.nvim_create_user_command('Grep', function (args)
    local rg_out = vim.fn.systemlist('rg ' .. '--vimgrep ' .. args.args )
    vim.fn.setqflist({}, ' ', {lines = rg_out, title = "Grep results"} )
    builtin.quickfix()
  end, { nargs = '*', desc = 'RipGrep working directory and open result in quickfix list'})

}
