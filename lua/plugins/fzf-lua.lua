return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      files = {
        file_icons = 'mini',
      },
    }

    local builtin = require 'fzf-lua'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_cword, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    --
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = 'Find Files (Root Dir)' })
    vim.keymap.set('n', '<leader>fg', require('fzf-lua').git_files, { desc = 'Find Files (Git Root)' })
    vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fh', require('fzf-lua').help_tags, { desc = 'Find Help' })
    vim.keymap.set('n', '<leader>fr', require('fzf-lua').oldfiles, { desc = 'Find Recent Files' })
    vim.keymap.set('n', '<leader>fz', require('fzf-lua').live_grep, { desc = 'Find Text' })
    vim.keymap.set('n', '<leader>fa', require('fzf-lua').lsp_code_actions, { desc = 'Find Code Actions' })
    -- vim.keymap.set('n', "<leader>sk", require('fzf-lua').keymaps, { desc = "Key Maps" })
  end,
  keys = {
    { '<leader>fc', '<cmd>FzfLua files cwd=' .. vim.fn.stdpath 'config' .. '<CR>', desc = 'Find Config File' },
  },
}
