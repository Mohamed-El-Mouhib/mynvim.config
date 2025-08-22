return {
	-- Some other plugin
	"nvim-lualine/lualine.nvim",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({})
			-- your keymaps...
		end,
	},
	"nvim-treesitter/nvim-treesitter",
}
