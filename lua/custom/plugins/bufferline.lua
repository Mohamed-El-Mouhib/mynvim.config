return {
  'akinsho/bufferline.nvim',
  version = '*', -- or a specific version
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- or "tabs"
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true,
          },
        },
      },
    }
    -- keymaps (optional)
    vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<CR>', {})
    vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<CR>', {})
    vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close current buffer' })
  end,
}
