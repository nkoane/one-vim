return {
  {
    'mfussenegger/nvim-lint',
    enabled = true,
    event = 'VeryLazy',
    config = function()
      require('lint').linters_by_ft = {
        markdown = { 'markdownlint', 'vale' },
        yaml = { 'yamllint' },
        php = { 'phpcs' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          require('lint').try_lint()
        end,
      })

      local noice = require 'noice'

      local progress = function()
        local linters = require('lint').get_running()
        if #linters == 0 then
          --          noice.redirect ('󰦕')
          return '󰦕'
        end

        --       noice.redirect('󱉶 ' .. table.concat(linters, ', '))
        return '󱉶 ' .. table.concat(linters, ', ')
      end

      -- NOTE: we can rewrite this better, i don't like creating variables we are not going to use
      local lualine = require 'lualine'
      local lualine_config = require('lualine').get_config()
      table.insert(lualine_config.sections.lualine_x, 1, progress)
      lualine.setup(lualine_config)

      vim.keymap.set('n', '<leader>cl', '<cmd>lua require("lint").try_lint()<cr>', { desc = 'try linting', noremap = true, silent = false })
    end,
  },
}
