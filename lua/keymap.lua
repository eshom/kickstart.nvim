-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>cd', vim.diagnostic.setloclist, { desc = 'Open [d]iagnostic Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Buffer navigation keybindings
-- stylua: ignore start
vim.keymap.set('n', '<leader>bn', function() vim.api.nvim_command 'bnext' end, { desc = 'Next [B]uffer' })
vim.keymap.set('n', '<leader>bp', function() vim.api.nvim_command 'bprev' end, { desc = 'Previous [B]uffer' })
vim.keymap.set('n', '<leader>bd', function() vim.api.nvim_command 'confirm bdelete' end, { desc = '[D]elete [B]uffer' })
vim.keymap.set('n', '<leader>bo', function() vim.api.nvim_command 'b#' end, { desc = 'Switch to [o]ther [B]uffer' })
-- stylua: ignore end

-- handy system clipboard interation
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank selection to system clipboard' })
vim.keymap.set('n', '<leader>yy', '"+yy', { desc = '[Y]ank line to system clipboard' })

-- Moving code around
vim.keymap.set('n', '<M-j>', ':m .+1<CR>==', { desc = 'Move line down(n)' })
vim.keymap.set('n', '<M-k>', ':m .-2<CR>==', { desc = 'Move line up(n)' })
vim.keymap.set('i', '<M-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move line down(i)' })
vim.keymap.set('i', '<M-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move line down(i)' })
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move line(s) down(v)' })
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move line(s) up(v)' })
