-- init.lua
require("core")

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define the opts variable if you have any options for lazy.nvim
local opts = {}

-- Load the plugins configurations
local plugins = require('plugins')

-- Load lazy.nvim with the plugins and options
require("lazy").setup({plugins, lsp}, opts)


-- Close nvim when done
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- If there's only one window left and it's nvim-tree, quit Neovim
        if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
            vim.cmd("quit")
        end
    end
})
