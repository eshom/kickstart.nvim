return {
  'jpalardy/vim-slime',
  lazy = false,
  config = function()
    vim.api.nvim_set_var('slime_target', 'neovim')
  end,
}
