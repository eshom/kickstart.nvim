return {
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
    init = function()
    -- stylua: ignore start
      vim.keymap.set('n', '<leader>tib', function() vim.api.nvim_command 'IBLToggle' end, { desc = '[T]oggle [I]ndent [B]lankline' })
      vim.keymap.set('n', '<leader>tis', function() vim.api.nvim_command 'IBLToggleScope' end, { desc = '[T]oggle [I]ndent Blankline [S]cope' })
      -- stylua: ignore end
    end,
  },
}
