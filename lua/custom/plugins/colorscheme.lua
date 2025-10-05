return {
  {
    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
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
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        style = 'night',
        transparent = true,
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
    end,
  },

  {
    'bluz71/vim-moonfly-colors',
    lazy = false,
    priority = 1000,
  },

  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        -- Your config here
        background = 'medium',
        transparent_background_level = 2,
        ui_contrast = 'high',
        float_style = 'dim',
      }
    end,
  },
}
