-- -- File: ~/.config/nvim/lua/plugins/indent.lua
return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = { char = '│' }, -- alternatives: "┊", "¦", "┆"
    scope = {
      enabled = true,
      -- show_start = false,
      -- show_end = false,
    },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'lazy',
        'mason',
        'neo-tree',
        'Trouble',
        'toggleterm',
      },
    },
  },
}
