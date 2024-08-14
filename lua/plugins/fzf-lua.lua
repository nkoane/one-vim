return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      files = {
        file_icons = "mini"
      },
      keys = {
        { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
      }
    })
    vim.keymap.set("n", "<leader>ff", require('fzf-lua').files, { desc = "Find Files (Root Dir)" })
    vim.keymap.set('n', '<leader>fg', require('fzf-lua').git_files, { desc = 'Find Files (Git Root)' })
    vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fh', require('fzf-lua').help_tags, { desc = 'Find Help' })
    vim.keymap.set('n', '<leader>fr', require('fzf-lua').oldfiles, { desc = 'Find Recent Files' })
    vim.keymap.set('n', '<leader>fz', require('fzf-lua').live_grep, { desc = 'Find Text' })
    vim.keymap.set('n', '<leader>fa', require('fzf-lua').lsp_code_actions, { desc = 'Find Code Actions' })
    vim.keymap.set('n', "<leader>sk", require('fzf-lua').keymaps, { desc = "Key Maps" })
  end
}
