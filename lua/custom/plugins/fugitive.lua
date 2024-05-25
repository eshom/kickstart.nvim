return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', function()
      vim.cmd 'Git'
    end, { desc = '[G]it [S]tatus' })

    vim.keymap.set('n', '<leader>gc', function()
      vim.cmd 'Git commit'
    end, { desc = '[G]it [C]commit' })

    vim.keymap.set('n', '<leader>gr', function()
      vim.cmd 'Git rebase -i'
    end, { desc = '[G]it [R]ebase' })

    vim.keymap.set('n', '<leader>gd', function()
      vim.cmd 'Git diff'
    end, { desc = '[G]it [D]iff' })

    vim.keymap.set('n', '<leader>gl', function()
      vim.cmd 'Git log'
    end, { desc = '[G]it [L]og' })

    vim.keymap.set('n', '<leader>gb', function()
      vim.cmd 'Git blame'
    end, { desc = '[G]it [B]lame' })

    vim.keymap.set('n', '<leader>gM', function()
      vim.cmd 'Git mergetool'
    end, { desc = '[G]it [M]erge tool' })

    vim.keymap.set('n', '<leader>gD', function()
      vim.cmd 'Git difftool'
    end, { desc = '[G]it [D]erge difftool' })
  end,
}
