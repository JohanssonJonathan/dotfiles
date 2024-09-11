return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	tag = "0.1.8",

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				layout_strategy = "center",
				layout_config = {

					-- other layout configuration here
				},
				-- Default configuration for telescope goes here:
				-- config_key = value,
			},
			pickers = {
				find_files = {
					prompt_prefix = "🔍",
				},
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		})
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
		vim.keymap.set("n", "<leader>fs", builtin.git_status, {})

		--Match words containing
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({
				prompt_title = "Find string in all files",
			})
		end, {})

		-- Match the exact word
		vim.keymap.set("n", "<leader>fw", function()
			builtin.live_grep({
				prompt_title = "Find strings with exact word",
				prompt_prefix = "🔥",
				additional_args = {
					"--word-regex",
				},
			})
		end, {})
	end,
}
