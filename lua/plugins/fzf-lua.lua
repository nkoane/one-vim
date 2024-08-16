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
  end,
  keys = {
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Find Files ./',
    },
    {
      '<leader>fc',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Config Files',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'Find Buffers',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').resume()
      end,
      desc = 'Find Resume',
    },
    {
      '<leader>f.',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = 'Find Recent Files',
    },
    --- other
    {
      '<leader>fh',
      function()
        require('fzf-lua').help_tags()
      end,
      desc = 'Find Help',
    },
    {
      '<leader>fm',
      function()
        require('fzf-lua').marks()
      end,
      desc = 'Find Marks',
    },
    {
      '<leader>fa',
      function()
        require('fzf-lua').lsp_code_actions()
      end,
      desc = 'Find [code] Actions',
    },
    --- search
    {
      '<leader>sc',
      function()
        require('fzf-lua').commands()
      end,
      desc = 'Search Commands',
    },
    {
      '<leader>sC',
      function()
        require('fzf-lua').command_history()
      end,
      desc = 'Search Commands History',
    },
    {
      '<leader>sg',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = 'Search [by] Grep',
    },
    {
      '<leader>sw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = 'Search [by] Word',
    },
    {
      '<leader>sk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = 'Search Keymaps',
    },
    {
      '<leader>sd',
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
      desc = 'Search Diagnostics',
    },

    -- git
    {
      '<leader>gf',
      function()
        require('fzf-lua').git_files()
      end,
      desc = 'Git Files',
    },
  },
}
