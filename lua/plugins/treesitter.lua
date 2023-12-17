-- plugins/treesitter.lua
return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate', -- This is equivalent to the 'do' key in vim-plug
    config = function()
        require('nvim-treesitter.configs').setup {
            -- Specify the languages you want to install, or use "all" to install all available parsers
            ensure_installed = {"lua", "bash", "python", "c_sharp", "javascript", "html", "css", "rust", "cpp", "c", "java"},
            -- ensure_installed = "all", -- Uncomment this line to install all parsers

            highlight = {
                enable = true, -- Enable treesitter-based syntax highlighting
            },
            -- Add more modules and configuration as needed
        }
    end,
}
