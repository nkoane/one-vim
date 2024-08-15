-- NOTE: Here is where you install your plugins.

local servers = {
  tsserver = {},
  svelte = {},
  cssls = {},
  emmet_language_server = {},
  tailwindcss = {},

  intelephense = {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php', 'blade' },
  },

  -- phpactor = {},

  stimulus_ls = {
    filetypes = { 'php', 'blade' },
  },

  rust_analyzer = {},

  lua_ls = {},
}

-- https://github.com/calebdw/dotfiles/blob/master/.config/nvim/lua/calebdw/plugins/lsp.lua

return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      automatic_installation = true,
      ensure_installed = servers,
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      auto_update = true,
      start_delay = 500,

      ensure_installed = {
        -- LSP
        'tsserver', -- Used for TypeScript
        'intelephense', -- Used for PHP
        'tailwindcss-language-server', -- Used for TailwindCSS
        -- DAP
        'php-debug-adpter',
        -- Linters
        'tlint',
        'biome',

        -- Formatters
        'prettierd',
        'sql-formatter',
        'tlint',
      },
    },
  },
  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      { 'j-hui/fidget.nvim', opts = {} },
      'williamboman/mason-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local lsp = require 'lspconfig'
      local configs = require 'lspconfig.configs'
      local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          -- map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
          -- map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
          -- map('gI', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
          -- map('<leader>D', require('fzf-lua').lsp_typedefs, 'Type [D]efinition')
          -- map('<leader>ds', require('fzf-lua').lsp_document_symbols, '[D]ocument [S]ymbols')
          -- map('<leader>ws', require('fzf-lua').lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')
          -- map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          --
          -- -- WARN: This is not Goto Definition, this is Goto Declaration.
          -- --  For example, in C this would take you to the header.
          -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>uh', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })


      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
        'tlint', -- Used to format blade
        'blade-formatter', -- Used to format blade
        'prettier', -- Used to format javascript, typescript, css, html, svelte
        'prettierd', -- Used to format javascript, typescript, css, html, svelte
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  { 'glepnir/lspsaga.nvim' }, -- UI for LSP client
  { -- ui for lsp progress
    'j-hui/fidget.nvim',
    tag = 'legacy',
  },
  {
    'smjonas/inc-rename.nvim',
    opts = {
      save_in_cmd_history = false,
    },
    keys = {
      {
        '<leader>rn',
        function()
          return ':IncRename ' .. vim.fn.expand '<cword>'
        end,
        expr = true,
        desc = 'Incremental Rename',
      },
    },
  },
}
