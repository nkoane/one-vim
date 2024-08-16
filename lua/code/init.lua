local info = debug.getinfo(1, 'S')
local filename = info.source:sub(2)
print('VSCode Ext: ' .. filename)

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local code = require 'vscode'

require 'code.plugins' --- get us plogins

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', 'fd', function()
  code.action 'editor.action.formatDocument'
  -- code.notify("Formatted document")
end)

vim.keymap.set('n', '<leader>fc', function()
  code.action 'workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup'
end)
vim.keymap.set('n', '<leader>ff', function()
  code.action 'workbench.action.quickOpen'
end)
vim.keymap.set('n', '<leader>bl', function()
  code.action 'workbench.action.nextEditor'
end)
vim.keymap.set('n', '<leader>bh', function()
  code.action 'workbench.action.previousEditor'
end)

vim.keymap.set({ 'n', 'x', 'i' }, 'sw', function()
  code.action('workbench.action.findInFiles', { args = { query = vim.fn.expand '<cword>' } })
end)

-- plugins
