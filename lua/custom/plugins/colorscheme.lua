-- always dark theme

return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- vim.cmd.colorscheme 'rose-pine'
    end,
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        styles = {
          transparency = true,
        },
      }
    end,
  },

  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme 'bamboo'
    end,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
        transparent = true,
      }
      -- require('bamboo').load()
    end,
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      -- vim.cmd.colorscheme 'tokyonight'
    end,
    config = function()
      require('tokyonight').setup {
        style = 'night',
        transparent = true,
      }
    end,
  },

  {
    'bluz71/vim-moonfly-colors',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'moonfly'
    end,
  },

  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    init = function()
      -- vim.cmd.colorscheme 'everforest'
    end,
    config = function()
      require('everforest').setup {
        -- Your config here
        background = 'medium',
        transparent_background_level = 2,
        ui_contrast = "high",
        float_style = "dim",
      }
    end,
  },
}
