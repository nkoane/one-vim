return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require 'nvim-treesitter.configs'
    configs.setup {
      -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
      ensure_installed = {
        'bash',
        'c',
        'cmake',
        'comment',
        'cpp',
        'css',
        'dockerfile',
        'elixir',
        'fish',
        'go',
        'graphql',
        'html',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'python',
        'regex',
        'rust',
        'scss',
        'svelte',
        'toml',
        'tsx',
        'typescript',
        'yaml',
        'php',
      },
      sync_install = true,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }
  end,
}
