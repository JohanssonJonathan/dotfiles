local luaSnip = require("luasnip")

local vscode = require("luasnip.loaders.from_vscode")

vscode.lazy_load()

vim.api.nvim_create_user_command("Snip", function()
	local table = {
		description = { "Logs property with name." },
		name = "consoleLogObject",
		regTrig = false,
		trigger = "clo",
		wordTrig = true,
	}
	local snippets = vim.inspect(table) -- Get snippet data

	vim.cmd("new") -- Creates a new empty buffer
	vim.cmd("setlocal buftype=nofile") -- Make it a temporary buffer (not a file)
	vim.cmd("setlocal bufhidden=wipe") -- Auto-remove buffer when closed

	-- Insert snippet data into the buffer
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(snippets, "\n"))
end, {})

vim.api.nvim_create_user_command("Snippets", function()
	local snippets = vim.inspect(luaSnip.available()) -- Get snippet data

	-- Open a new buffer
	vim.cmd("new") -- Creates a new empty buffer
	vim.cmd("setlocal buftype=nofile") -- Make it a temporary buffer (not a file)
	vim.cmd("setlocal bufhidden=wipe") -- Auto-remove buffer when closed

	-- Insert snippet data into the buffer
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(snippets, "\n"))
end, {})

vim.keymap.set({ "i", "s" }, "<Tab>", function()
	require("luasnip").expand_or_jump()
end, {})

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	require("luasnip").jump(-1)
end, { silent = true })
