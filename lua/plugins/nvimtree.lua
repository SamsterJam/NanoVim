-- plugins/nvimtree.lua
return {
	'kyazdani42/nvim-tree.lua',
	requires = {
		'kyazdani42/nvim-web-devicons', -- optional, for file icons
	},
	tag = 'nightly', -- Use the branch that suits you best
	config = function()
		require('nvim-tree').setup {
			-- Your existing configuration
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			diagnostics = {
				enable = false,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			-- More options can be found in the documentation
		}

		-- Set keymap for NvimTreeToggle
		vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })



		-- Autocommand to open NvimTree on startup only for directories or [No Name] buffers
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local path = vim.fn.expand('%:p') -- Get the full path of the current file
                if path == "" or vim.fn.isdirectory(path) == 1 then
                    -- If the path is a directory, change the working directory to that path
                    if vim.fn.isdirectory(path) == 1 then
                        vim.cmd('cd ' .. vim.fn.fnameescape(path))
                    end
                    -- Open NvimTree at the current working directory
                    require("nvim-tree.api").tree.open()
                end
            end
        })
				

		-- Autocommand to set Ctrl+X keymap for NvimTree with a delay
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "NvimTree",
            callback = function()
                vim.defer_fn(function()
                    -- Set Ctrl+X to close NvimTree window and handle closing Neovim or switching buffer
                    vim.api.nvim_buf_set_keymap(0, 'n', '<C-x>', '<cmd>lua CloseNvimTree()<CR>', { noremap = true, silent = true })
                end, 100) -- Delay in milliseconds
            end
        })

        -- Lua function to close NvimTree and handle window/buffer closing logic
        _G.CloseNvimTree = function()
            -- Close the NvimTree window
            require("nvim-tree.api").tree.close()

            -- If it's the last window, quit Neovim
            if #vim.api.nvim_list_wins() == 1 then
                vim.cmd('quit')
            else
                -- Otherwise, go to the previous buffer
                vim.cmd('buffer #')
            end
        end
    end,
}
