return {
  {
    'rcarriga/nvim-notify',
    enable = false,
    keys = {
      {
        '<leader>dn',
        function()
          require('notify').dismiss { silent = true, pending = true }
        end,
        desc = 'Dismiss All Notifications',
      },
      {
        '<leader>p',
        function()
          vim.notify('Pong', vim.log.levels.INFO)
        end,
        desc = 'Ping',
      },
    },
    opts = {
      stages = 'slide',
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.45)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.45)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      render = 'wrapped-compact',
      border = 'solid',
    },
  },
  -- {
  --   'echasnovski/mini.notify',
  --   version = '*',
  --   keys = {
  --
  --     {
  --       '<leader>p',
  --       function()
  --         vim.notify(
  --           'Pong',
  --           vim.log.levels.INFO
  --         )
  --       end,
  --       desc = 'Pong',
  --     },
  --   },
  --   opts = {
  --     winblend = 0,
  --     window = {
  --       config = {},
  --       max_width_share = 0.182,
  --       winblend = 0,
  --     },
  --   },
  -- },
}
