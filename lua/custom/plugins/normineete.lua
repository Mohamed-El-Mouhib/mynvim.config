return {
	{
		"hardyrafael17/norminette42.nvim",
		lazy = true,
		cmd = { "NorminetteEnable" },
		config = function()
			local norminette = require("norminette")
			norminette.setup({
				runOnSave = true, -- check on save
				maxErrorsToShow = 5, -- only show 5 errors
				active = true, -- plugin is now active
			})
		end,
	},
}
