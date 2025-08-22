return {
	"hrsh7th/nvim-cmp",
	dependencies = { "L3MON4D3/LuaSnip" },
	opts = function(_, opts)
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		opts.mapping = cmp.mapping.preset.insert({
			-- Navigate completion menu with Ctrl-n / Ctrl-p
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

			-- Expand or jump in snippet with Tab / Shift-Tab
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		})
	end,
}
