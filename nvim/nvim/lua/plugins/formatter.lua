return {

	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {

				javascript = {

					-- function()
					--           return require("formatter.filetypes.javascript").prettier()
					-- end,
				},
				typescript = {

					function()
						return require("formatter.filetypes.typescript").biome()
					end,
				},
				typescriptreact = {

					function()
						return require("formatter.filetypes.typescriptreact").biome()
					end,
				},
				-- Formatter configurations for filetype "lua" go here

				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the

					-- "lua" filetype

					-- You can also define your own configuration

					require("formatter.filetypes.lua").stylua,
					-- You can also define your own configuration
					function()
						local util = require("formatter.util")
						-- Supports conditional formatting
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						-- Full specification of configurations is down below and in Vim help
						-- files
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
			},
		})
	end,
}
