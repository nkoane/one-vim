return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd [[colorscheme tokyonight-storm]]
    end,
  },
  {
    -- 'arcticicestudio/nord-vim',
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nord').setup {}
      vim.cmd.colorscheme 'nord'
      -- vim.cmd [[colorscheme nord]]
    end,
  },
}
