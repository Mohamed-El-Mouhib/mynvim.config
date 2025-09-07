return {
	"goolord/alpha-nvim",
	event = "VimEnter", -- Load on startup
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header
		dashboard.section.header.val = {
			[[                               .-----.        ]],
			[[    .----------------------.   | === |        ]],
			[[    |.-""""""""""""""""""-.|   |-----|        ]],
			[[    ||                    ||   | === |        ]],
			[[    ||   KICKSTART.NVIM   ||   |-----|        ]],
			[[    ||                    ||   | === |        ]],
			[[    ||                    ||   |-----|        ]],
			[[    ||:Tutor              ||   |:::::|        ]],
		       	[[    |'-..................-'|   |____o|        ]],
                        [[    `"")----------------(""`   ___________    ]],
                        [[   /::::::::::|  |::::::::::\  \ no mouse \   ]],
                        [[  /:::========|  |==hjkl==:::\  \ required \  ]],
                        [[ '""""""""""""'  '""""""""""""'  '""""""""""' ]],
}


		-- Menu Buttons
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("e", "  File Explorer", "<cmd>Neotree toggle<CR>"),
			dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("q", "  Quit Neovim", "<cmd>qa<CR>"),
		}

		-- Footer
		local made_by_line = "this config is made\t\t"
		local author_line = "by arth.re01"
		local nav_line = "Navigate with j, k, h, l"

		local width = vim.fn.winwidth(0)
		local margin = 2 -- Margin from the right edge

		local made_by_padding = string.rep(" ", width - #made_by_line - margin)
		local author_padding = string.rep(" ", width - #author_line - margin)
		local nav_padding = string.rep(" ", width - #nav_line - margin)

		dashboard.section.footer_made_by = {
			type = "text",
			val = { made_by_padding .. made_by_line },
			opts = { hl = "Comment" },
		}
		dashboard.section.footer_author = {
			type = "text",
			val = { author_padding .. author_line },
			opts = { hl = "String" }, -- A bright color like white or yellow
		}
		dashboard.section.footer_nav = {
			type = "text",
			val = { nav_padding .. nav_line },
			opts = { hl = "Comment" },
		}

		-- Set the layout
		dashboard.opts.layout = {
			{ type = "padding", val = 4 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 14 },
			dashboard.section.footer_made_by,
			dashboard.section.footer_author,
			dashboard.section.footer_nav,
		}

		alpha.setup(dashboard.opts)
	end,
}
