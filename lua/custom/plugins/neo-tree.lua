return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- optional
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Setup the autocmd for window resizing
		vim.api.nvim_create_autocmd("WinClosed", {
			callback = function()
				vim.defer_fn(function()
					vim.cmd("wincmd =")
				end, 50)
			end,
		})

		-- Setup neo-tree
		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree if it is the last window
			window = {
				width = 30,
				mappings = {
					["<cr>"] = "open",
					["S"] = "split_with_window_picker",
					["s"] = "vsplit_with_window_picker",
					["t"] = "open_tabnew",
					["H"] = "toggle_hidden", -- Shift+H to toggle hidden files
				},
			},
			filesystem = {
				filtered_items = {
					visible = false, -- Hide hidden files by default
					hide_dotfiles = true,
					hide_gitignored = true,
				},
			},
		})
	end,
}
