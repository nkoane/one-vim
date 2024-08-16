local style = {
  border = {
    style = 'single',
    padding = { 1 },
  },
}
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      view = 'cmdline_popup',
    },
    views = {
      -- huh
      cmdline_popup = {
        border = style.border,
        -- win_options = {
        --   winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
        -- },
        -- position = {
        --   -- relative = 'editor',
        --   row = 5,
        --   col = '50%',
        -- },
        popupmenu = {
          border_opts = {
            style = 'single',
            padding = { 1, 1 },
          },
        },
      },
    },
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
          },
        },
        view = 'mini',
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>un",  "",                                                                            desc = "+noice" },
    { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                              desc = "Redirect Cmdline" },
    { "<leader>unl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
    { "<leader>unh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
    { "<leader>una", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
    { "<leader>und", function() require("noice").cmd("dismiss") end,                                desc = "Dismiss All" },
    { "<leader>unt", function() require("noice").cmd("pick") end,                                   desc = "Noice Picker (Telescope/FzfLua)" },
    { "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,                           expr = true,              desc = "Scroll Forward",  mode = { "i", "n", "s" } },
    { "<c-b>",       function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,                           expr = true,              desc = "Scroll Backward", mode = { "i", "n", "s" } },
  },
  config = function(_, opts)
    -- HACK: noice shows messages from before it was enabled,
    -- but this is not ideal when Lazy is installing plugins,
    -- so clear the messages in this case.
    if vim.o.filetype == 'lazy' then
      vim.cmd [[messages clear]]
    end
    require('noice').setup(opts)
  end,
}
