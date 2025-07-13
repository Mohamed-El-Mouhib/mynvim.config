-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- The LSP configuration now sits *inside* the returned table
  {
    -- LSP Support
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      -- This function gets executed when the plugin is loaded
      -- It will be our main place for LSP configuration

      -- This function will be called for each server that is set up
      -- It allows you to set keymaps only for buffers with an active LSP
      local on_attach = function(client, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('n', keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
        end

        -- Keymaps for LSP actions
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        -- These require telescope.nvim to be installed
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See hover information
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        -- When in insert mode, you can also trigger signature help
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { buffer = bufnr, noremap = true, silent = true, desc = 'LSP: Signature Help' })
      end

      -- Setup mason so it can manage LSP servers
      require('mason').setup()

      -- Setup mason-lspconfig to bridge Mason with lspconfig
      require('mason-lspconfig').setup {
        -- A list of servers to automatically install if they're not already installed
        ensure_installed = { 'lua_ls', 'bashls', 'marksman' },
      }

      -- Get the capabilities for the LSP client
      -- This line requires that you have the nvim-cmp plugin installed
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup lspconfig for each server installed via Mason
      require('mason-lspconfig').setup_handlers {
        function(server_name) -- Default handler
          require('lspconfig')[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,
        ['lua_ls'] = function() -- Custom handler for lua_ls
          require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  -- Get the language server to recognize "vim" as a global
                  globals = { 'vim' },
                },
              },
            },
          }
        end,
      }
    end,
  },
}
