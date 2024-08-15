return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  {
    'arcticicestudio/nord-vim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd [[colorscheme nord]]
    end,
  },
}
