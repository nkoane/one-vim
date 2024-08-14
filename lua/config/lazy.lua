-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- i want to be in control so i know what does what

    { import = 'plugins/tokyonight' },
    { import = 'plugins/mini' },
    { import = 'plugins/dressing' },
    { import = 'plugins/fzf-lua' },

    { import = 'plugins/which-key' },
    { import = 'plugins/git-signs' },
    { import = 'plugins/autopairs' },

    { import = 'plugins/persist' },

    { import = 'plugins/notify' },
    { import = 'plugins/lualine' },
    { import = 'plugins/noice' },

    { import = 'plugins/dashboard' },
    { import = 'plugins/neotree' },
    { import = 'plugins/comments' },

    { import = 'plugins/treesitter' },
    { import = 'plugins/lisp' },
    { import = 'plugins/copilot' },
    -- { import = 'plugins/lsp' },
    -- { import = 'plugins/lsp/formatter' },
    -- { import = 'plugins/lsp/linter' },

    -- { import = 'plugins/completion' },
    -- { import = 'plugins/lsp' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'retrobox' } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
