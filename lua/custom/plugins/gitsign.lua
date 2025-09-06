return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true, -- show blame inline
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- show at end of line
			delay = 0,
		},
		current_line_blame_formatter = "<author>", -- show only username
	},
}
