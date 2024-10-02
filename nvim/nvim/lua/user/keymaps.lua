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
