-- plugins/undotree.lua
return {
    'mbbill/undotree',
    config = function()
        -- Add any configuration for undotree here if needed
        -- For example, you can set key mappings to open the undotree:
        vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
    end,
}
