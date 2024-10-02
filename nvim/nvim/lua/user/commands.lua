vim.api.nvim_create_user_command("Opt", "vert options", {})
vim.api.nvim_create_user_command("WKey", "vert WhichKey", {})
vim.api.nvim_create_user_command("Diff", function()
	local Gitsigns = require("gitsigns")

	Gitsigns.diffthis()
end, {})

vim.api.nvim_create_user_command("Stage", function()
	local Gitsigns = require("gitsigns")

	Gitsigns.stage_buffer()
end, {})
vim.api.nvim_create_user_command("Term", "vsplit | terminal", {})
