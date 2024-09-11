require("user.options")
require("user.keymaps")
require("user.packages")
require("user.snippets")
require("user.commands")
-- Disabled swapper files on current buffer
local bufnr = vim.api.nvim_get_current_buf()

vim.api.nvim_buf_set_option(bufnr, "swapfile", false)
