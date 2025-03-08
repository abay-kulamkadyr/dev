vim.g.mapleader = " ";

-- Normal mode mappings
vim.keymap.set('n', '<leader>pv', ':Vex<CR>', { silent = true })
vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':cnext<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':cprev<CR>', { silent = true })
vim.keymap.set('n', '<leader>y', '"+y', { silent = true })
vim.keymap.set('n', '<leader>Y', 'gg"+yG', { silent = true })

vim.keymap.set('n', '<leader>i', 'gg=G', { silent = true })
--
-- 
-- Visual mode mappings
vim.keymap.set('v', '<leader>p', '"_dP', { silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

