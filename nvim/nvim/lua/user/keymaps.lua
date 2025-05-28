-- triggers format on save
vim.keymap.set("n", "<leader>f", function()
	vim.cmd("Format")

	-- local currentPath = vim.fn.expand("%:p")
	-- vim.cmd("write!" .. currentPath)
end)
local function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end
vim.keymap.set("n", "<leader>sd", function()
	vim.diagnostic.open_float({
		bufnr = 0,
	})
end)

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

vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		resize_vertical_to_percentage(70)
	end,
})
