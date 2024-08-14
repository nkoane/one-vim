return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set('n', '<leader>tx', '<CMD>Neotree toggle<CR>', { desc = 'Toggle Neotree' })
    vim.keymap.set('n', '<leader>tf', '<CMD>Neotree float<CR>', { desc = 'Float Neotree' })
    require('neo-tree').setup {
      close_if_last_window = true,
      window = {
        position = 'right',
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    }
    -- vim.keymap.set("n", "<leader>xf", "<CMD>Neotree float<CR>")
  end,
}
