return {
	"Diogo-ss/42-header.nvim",
	cmd = { "Stdheader" },
	keys = { "<F1>" },
	opts = {
		default_map = true, -- map <F1> to add/update header
		auto_update = true, -- update on save
		user = "mel-mouh", -- your 42 login
		mail = "mel-mouh@student.1337.ma", -- or your student email
		-- additional options available
	},
	config = function(_, opts)
		require("42header").setup(opts)
	end,
}
