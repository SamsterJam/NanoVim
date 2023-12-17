return{
	"m4xshen/autoclose.nvim", -- Plugin repository
        event = "InsertEnter", -- Lazy load on entering insert mode
        config = function()
            require("autoclose").setup()
        end
}

