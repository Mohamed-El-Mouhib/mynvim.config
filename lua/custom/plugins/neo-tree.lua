return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- optional
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      window = {
        width = 30,
        mappings = {
          ['<space>'] = 'toggle_node',
          ['<cr>'] = 'open',
          ['S'] = 'split_with_window_picker',
          ['s'] = 'vsplit_with_window_picker',
          ['t'] = 'open_tabnew',
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    }
  end,
}
