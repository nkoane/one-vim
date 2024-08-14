-- one last hurrah into this.

if vim.g.vscode then
    -- VSCode extension
    require("config.vscode")
else
    -- ordinary Neovim
    require("config.options")
    require("config.keymaps")
    require("config.lazy")
end
