local info = debug.getinfo(1, 'S')
local filename = info.source:sub(2)
print('VSCode Ext: ' .. filename)

-- just in case
vim.keymap.set('i', 'jk', '<esc>', { desc = 'escape to normal mode' })
