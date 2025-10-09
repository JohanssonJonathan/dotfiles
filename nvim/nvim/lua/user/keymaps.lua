-- triggers format on save
vim.keymap.set("n", "<leader>f", function()
	vim.cmd("Format")
end)
-- use the same keymap again to jump into the window.
vim.keymap.set("n", "<leader>sd", function()
	vim.diagnostic.open_float(nil, {
		width = 80, -- Set your desired width here
		border = "rounded",
	})
end)

-- Overriding the styles for vim.lsp.buf.hover()
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- Options: "single", "double", "rounded", "solid", "shadow"
	max_width = 80,
	max_height = 20,
	focusable = true,
})

-- use the same keymap again to jump into the window.
vim.keymap.set("n", "<leader>h", function()
	vim.lsp.buf.hover()
end)

vim.keymap.set("n", "<leader>di", function()
	local Gitsigns = require("gitsigns")

	Gitsigns.diffthis()
end)

vim.keymap.set("n", "<leader>gd", function()
	local Gitsigns = require("gitsigns")

	Gitsigns.reset_buffer()
end)

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

local function resize_vertical_to_percentage(percent)
	local total_width = vim.o.columns
	local target_width = math.floor(total_width * percent / 100)

	vim.cmd("vertical resize " .. target_width)
end

vim.keymap.set("n", "<leader>v]", function()
	local tag = vim.fn.expand("<cword>")
	if tag ~= "" then
		vim.cmd("vsplit")
		vim.cmd("wincmd l") -- Move to the new split (right)
		vim.cmd("tjump " .. tag)
	else
		print("No tag under cursor")
	end
end, { desc = "Jump to tag in vertical split and focus it" })

vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		resize_vertical_to_percentage(70)
	end,
})
