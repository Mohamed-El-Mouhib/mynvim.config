return {
  -- Some other plugin
  'nvim-lualine/lualine.nvim',

  -- Your trouble.nvim code is just another item in the list.
  -- NO "return" here.
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup {}
      -- your keymaps...
    end,
  },

  -- Another plugin
  'nvim-treesitter/nvim-treesitter',
}
