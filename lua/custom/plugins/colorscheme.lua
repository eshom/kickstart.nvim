return {
  {
    'scottmckendry/cyberdream.nvim',
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        highlights = {
          BlinkCmpMenuSelection = {},
        },
      }
    end,
  },

  {
    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
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
    priority = 1000,
    config = function()
      require('bamboo').setup {
        transparent = true,
      }
      require('bamboo').load()
    end,
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
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
    priority = 1000,
  },

  {
    'neanias/everforest-nvim',
    version = false,
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

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
        float = {
          transparent = false, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
      }
    end,
  },

  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
  },

  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        transparent = true,
        theme = 'wave',
      }
    end,
  },

  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        transparent = true,
        style = 'darker',
      }
      -- Enable theme
      require('onedark').load()
    end,
  },
}
