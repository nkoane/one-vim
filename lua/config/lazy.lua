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

vim.cmd 'colorscheme retrobox'

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- i want to be in control so i know what does what

    { import = 'plugins/themes' },
    { import = 'plugins/mini' },
    { import = 'plugins/which-key' },
    { import = 'plugins/fzf-lua' },
    { import = 'plugins/dressing' },
    --
    { import = 'plugins/git-signs' },
    { import = 'plugins/autopairs' }, -- this adds pairs of quotes, brackets, et al
    --
    { import = 'plugins/persist' }, -- the following plugin is for persisting the session

    { import = 'plugins/notify' },
    { import = 'plugins/noice' },

    { import = 'plugins/lualine' },
    { import = 'plugins/flash' },
    { import = 'plugins/trouble' },
    --
    { import = 'plugins/dashboard' },
    { import = 'plugins/neotree' },
    { import = 'plugins/comments' },
    --
    { import = 'plugins/treesitter' },
    { import = 'plugins/lint' },
    { import = 'plugins/lisp' },
    { import = 'plugins/formatter' },
    { import = 'plugins/completion' },
    { import = 'plugins/copilot' },

    { import = 'plugins/lazygit' },

    -- extra

    -- { import = 'plugins/blade' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'retrobox' } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
