-- TODO: blade.php configuration
-- local lspconfig = require 'lspconfig'
-- local configs = require 'lspconfig.configs'
--
-- -- Configure it
-- configs.blade = {
--   default_config = {
--     -- Path to the executable: laravel-dev-generators
--     cmd = { 'laravel-dev-generators', 'lsp' },
--     filetypes = { 'blade' },
--     root_dir = function(fname)
--       return lspconfig.util.find_git_ancestor(fname)
--     end,
--     settings = {},
--   },
-- }
-- -- Set it up
-- lspconfig.blade.setup {
--   -- Capabilities is specific to my setup.
--   -- vim.lsp.protocol.make_client_capabilities()
--   --
--   capabilities = capabilities,
-- }

return {
  {
    'noevim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      local configs = require 'lspconfig.configs'
      configs.blade = {
        default_config = {
          cmd = { 'laravel-dev-generators', 'lsp' },
          filetypes = { 'blade' },
          root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
          end,
          settings = {},
        },
      }
      lspconfig.blade.setup {
        -- cmp_nvim_lsp.default_capabilities
        capabilities = require('cmp_nvim_lsp').update_capabilities(cmp_nvim_lsp.default_capabilities),
      }
    end,
  },
  {
    'ricardoramirezr/blade-nav.nvim',
    ft = { 'blade', 'php' },
  },
  {
    'jwalton512/vim-blade',
  },
  {
    'noahfrederick/vim-laravel',
    dependencies = {
      'tpope/vim-dispatch',
      'tpope/vim-projectionist',
      'noahfrederick/vim-composer',
    },
  },
}
