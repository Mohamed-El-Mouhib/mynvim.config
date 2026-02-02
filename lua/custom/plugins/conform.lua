return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				python = { "black" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true, -- use LSP if no formatter exists
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ async = true })
		end, { desc = "Format buffer" })
	end,
}
