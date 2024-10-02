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

                                        typescript = {


                                                  function()
                                                            -- Supports conditional formatting


                                                            -- Full specification of configurations is down below and in Vim help

                                                            -- files
                                                            --
                                                            return require("formatter.filetypes.typescript").prettier()
                                                            --                                                       return {
                                                            -- 	exe = "stylua",
                                                            -- 	args = {
                                                            -- 		"--search-parent-directories",
                                                            -- 		"--stdin-filepath",
                                                            -- 		util.escape_path(util.get_current_buffer_file_path()),
                                                            -- 		"--",
                                                            -- 		"-",
                                                            -- 	},
                                                            -- 	stdin = true,
                                                            -- }
                                                  end,
                                        },
                                        typescriptreact = {

                                                  function()
                                                            -- Supports conditional formatting


                                                            -- Full specification of configurations is down below and in Vim help

                                                            -- files
                                                            --
                                                            return require("formatter.filetypes.typescriptreact")
                                                                .prettier()
                                                            --                                                       return {
                                                            -- 	exe = "stylua",
                                                            -- 	args = {
                                                            -- 		"--search-parent-directories",
                                                            -- 		"--stdin-filepath",
                                                            -- 		util.escape_path(util.get_current_buffer_file_path()),
                                                            -- 		"--",
                                                            -- 		"-",
                                                            -- 	},
                                                            -- 	stdin = true,
                                                            -- }
                                                  end,
                                        },
                                        -- Formatter configurations for filetype "lua" go here

                                        -- and will be executed in order
                                        lua = {
                                                  -- "formatter.filetypes.lua" defines default configurations for the

                                                  -- "lua" filetype

                                                  -- You can also define your own configuration

                                                  function()
                                                            -- Supports conditional formatting

                                                            local util = require("formatter.util")
                                                            if util.get_current_buffer_file_name() == "special.lua" then
                                                                      return nil
                                                            end

                                                            -- Full specification of configurations is down below and in Vim help

                                                            -- files
                                                            return require("formatter.filetypes.lua").stylua()
                                                            --                                                       return {
                                                            -- 	exe = "stylua",
                                                            -- 	args = {
                                                            -- 		"--search-parent-directories",
                                                            -- 		"--stdin-filepath",
                                                            -- 		util.escape_path(util.get_current_buffer_file_path()),
                                                            -- 		"--",
                                                            -- 		"-",
                                                            -- 	},
                                                            -- 	stdin = true,
                                                            -- }
                                                  end,
                                        },

                                        -- Use the special "*" filetype for defining formatter configurations on
                                        -- any filetype
                                        -- ["*"] = {
                                        -- 	-- "formatter.filetypes.any" defines default configurations for any
                                        -- 	-- filetype
                                        -- 	require("formatter.filetypes.any").remove_trailing_whitespace,
                                        -- },
                              },
                    })
          end,
}
