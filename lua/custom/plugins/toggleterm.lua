return {
  'akinsho/toggleterm.nvim',
  version = '*', -- Replace "*" with a specific version if needed
  config = function()
    require('toggleterm').setup {
      -- Customize as needed
      size = 20,
      open_mapping = [[<c-o>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float', -- 'vertical', 'horizontal', 'tab', 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 3,
      },
    }
  end,
}
