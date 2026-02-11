return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>mm', function()
      harpoon:list():add()
    end, { desc = '[M]ark file' })
    vim.keymap.set('n', '<leader>mt', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[T]oggle harpoon quick menu' })

    vim.keymap.set('n', '<leader>m1', function()
      harpoon:list():select(1)
    end, { desc = 'Select file [1]' })
    vim.keymap.set('n', '<leader>m2', function()
      harpoon:list():select(2)
    end, { desc = 'Select file [2]' })
    vim.keymap.set('n', '<leader>m3', function()
      harpoon:list():select(3)
    end, { desc = 'Select file [3]' })
    vim.keymap.set('n', '<leader>m4', function()
      harpoon:list():select(4)
    end, { desc = 'Select file [4]' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>mp', function()
      harpoon:list():prev()
    end, { desc = '[P]revious file' })
    vim.keymap.set('n', '<leader>mn', function()
      harpoon:list():next()
    end, { desc = '[N]ext file' })
  end,
}
