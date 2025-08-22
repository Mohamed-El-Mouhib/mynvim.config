return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
	config = function()
		require("fzf-lua").setup({})
	end,
}
