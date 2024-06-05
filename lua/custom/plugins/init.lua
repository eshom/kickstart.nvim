-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'rose-pine-moon'
      vim.cmd.colorscheme 'rose-pine'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
    config = function()
      require('rose-pine').setup {
        dim_inactive_windows = true,

        -- highlight_groups = {
        --   Normal = { bg = 'highlight low' },
        --   CursorLine = {bg = 'base'},
        -- },
      }
    end,
  },
}
