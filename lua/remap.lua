local keymap = vim.keymap.set

keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymap({ 'n', 'v' }, 'J', 'j')

keymap('n', '<leader>v', '<cmd>vsplit<CR>')
keymap('n', '<leader>w', '<cmd>w<CR>', { desc = 'soft save' })
keymap('n', '<leader>W', '<cmd>w!<CR>', { desc = 'hard save' })
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'soft quit' })
keymap('n', '<leader>Q', '<cmd>q!<CR>', { desc = 'hard quit' })

vim.cmd [[map H ^]]
vim.cmd [[map L $]]
vim.cmd [[map K k]]
vim.cmd [[map J j]]

vim.api.nvim_set_keymap('n', '<leader>=', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })

-- commenting
vim.keymap.set('n', '<C-c>', function() require('Comment.api').toggle.linewise.current() end, { desc = 'Toggle comment (line)' })

-- Toggle comment for visual selection
vim.keymap.set('v', '<C-c>', function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment (visual)' })

-- Copy to system clipboard
keymap('v', '<leader>y', '"+y')
keymap('n', '<leader>y', '"+yy')
