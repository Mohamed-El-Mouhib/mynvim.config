return {
	-- Emmet LSP for VSCode-style completion
	{
		"mattn/emmet-vim", -- classic Emmet plugin
		event = "InsertEnter", -- lazy load when entering insert mode
	},

	-- Optional: auto-close and rename HTML/JSX tags
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end
	},

	-- LSP config for Emmet
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"vue",
					"svelte",
					"xml",
				},
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
			})
		end
	},
}