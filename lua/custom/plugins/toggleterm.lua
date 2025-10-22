return {
	"akinsho/toggleterm.nvim",
	version = "*", -- Replace "*" with a specific version if needed
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-o>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float", -- 'vertical', 'horizontal', 'tab', 'float'
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				width = 100,
				height = 25,
				border = "curved",
				winblend = 3,
			},
		})
	end,
}
