-- Autoformat

local slow_format_filetypes = {
  injected = true,
}

return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>bf',
        function()
          require('conform').format { async = true, lsp_fallback = false, timeout_ms = 5000 }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      log_leve = vim.log.levels.DEBUG,
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 1500,
          lsp_fallback = false,
          -- lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      format_after_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { timeout_ms = 5000, lsp_fallback = true }
      end,
      formatters = {},
      formatters_by_ft = {
        lua = { 'stylua' },

        javascript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },

        html = { 'prettier', 'prettierd', stop_after_first = true },
        css = { 'prettier', 'prettierd', stop_after_first = true },

        svelte = { 'prettierd', 'prettier', stop_after_first = true },

        blade = { 'blade-formatter', stop_after_first = true },
        php = { 'phpcbf', 'php_cs_fixer', stop_after_first = true },

        rust = { 'rustfmt', stop_after_first = true },

        sql = { 'pg_format', 'sqlfmt', stop_after_first = true },
        yaml = { 'yamlfmt' },
        json = { 'biome', 'prettier', 'jq', stop_after_first = true },

        ['*'] = { 'injected' },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
