return {
  'nvim-pack/nvim-spectre',
  keys = {
    {
      '<leader>S',
      function()
        require('spectre').toggle()
      end,
      desc = 'Toggle Spectre',
    },
  },
}
