return {
  {
    'folke/which-key.nvim',
    opts = {
      spec = {
        { '<BS>', desc = 'Decrement Selection', mode = 'x' },
        { '<c-space>', desc = 'Increment Selection', mode = { 'x', 'n' } },
      },
    },
  },

  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'lua', 'bash', 'regex' },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { 'ruby' },
      },
    },
    config = function(_, opts) -- luacheck: ignore
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    opts = {},
  },
}
