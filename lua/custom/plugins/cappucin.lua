return {
  'catppuccin/nvim',
  name = 'catppuccin', -- this is needed if you use the name in :colorscheme
  priority = 1000,
  lazy = false,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- "latte", "frappe", "macchiato"
      -- transparent_background = false, -- optional
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
