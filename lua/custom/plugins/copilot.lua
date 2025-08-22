return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"zbirenbaum/copilot.lua", -- better Lua integration
			-- "nvim-lua/plenary.nvim",
		},
		build = "make tiktoken",
		opts = {
			filetypes = {
				["*"] = true,
			},
		},
		cmd = { "Copilot", "CopilotChat" }, -- lazy load
	},
}
