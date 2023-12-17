vim.g.mapleader = " "


-- Map Ctrl+Space to toggle between insert mode and normal mode in Neovim
vim.api.nvim_set_keymap('i', '<C-Space>', '<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Space>', 'i', {noremap = true, silent = true})



-- Map Ctrl+S to save the current file in Neovim
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', {noremap = true, silent = true})



-- Map Ctrl+X to quit the current window in Neovim
vim.api.nvim_set_keymap('n', '<C-x>', ':q<CR>', {noremap = true, silent = true})

-- Map Ctrl+X to quit the current window in Neovim from insert mode
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc>:q<CR>', {noremap = true, silent = true})
