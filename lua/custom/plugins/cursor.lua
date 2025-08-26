return {
	"sphamba/smear-cursor.nvim",
	opts = {
		cursor_color = "#ff4500", -- Fire orange
		normal_bg = "none", -- Transparent background if supported
		smear_between_buffers = true,
		smear_between_neighbor_lines = true,
		legacy_computing_symbols_support = true,
		transparent_bg_fallback_color = "#330000", -- Dark red fallback
		stiffness = 0.8,
		trailing_stiffness = 0.5,
		trailing_exponent = 2,
		hide_target_hack = false,
	},
}
