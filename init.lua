-- one last hurrah into this.

if vim.g.vscode then
	-- VSCode extension
	require("code.init")
	-- require("code.plugins")
else
	-- ordinary Neovim
	require("config.keymaps")
	require("config.options")
	require("config.lazy")
	-- require("config.setttings")
end
