-- Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		require("lspconfig").tsserver.setup({})
	-- 		print("installed")
	-- 	end,
	-- },
	--
	--
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	config = function()
	-- 		require("mason-lspconfig").setup({ ensure_installed = { "tsserver" } })
	-- 	end,
	-- },
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	config = function()
	-- 		-- import mason
	-- 		local mason = require("mason")
	--
	-- 		-- enable mason and configure icons
	-- 		mason.setup({
	-- 			ui = {
	-- 				icons = {
	-- 					package_installed = "✓",
	-- 					package_pending = "➜",
	-- 					package_uninstalled = "✗",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		local conform = require("conform")
	--
	-- 		conform.setup({
	-- 			formatters_by_ft = {
	-- 				javascript = { "prettier" },
	-- 				typescript = { "prettier" },
	-- 				javascriptreact = { "prettier" },
	-- 				typescriptreact = { "prettier" },
	-- 				svelte = { "prettier" },
	-- 				css = { "prettier" },
	-- 				html = { "prettier" },
	-- 				json = { "prettier" },
	-- 				yaml = { "prettier" },
	-- 				markdown = { "prettier" },
	-- 				graphql = { "prettier" },
	-- 				lua = { "stylua" },
	-- 				python = { "isort", "black" },
	-- 			},
	-- 			format_on_save = {
	-- 				lsp_fallback = true,
	-- 				async = false,
	-- 				timeout_ms = 500,
	-- 			},
	-- 		})
	--
	-- 		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	-- 			conform.format({
	-- 				lsp_fallback = true,
	-- 				async = false,
	-- 				timeout_ms = 500,
	-- 			})
	-- 		end, { desc = "Format file or range (in visual mode)" })
	-- 	end,
	-- },
	-- -- Vscode-like pictograms
	-- {
	-- 	"onsails/lspkind.nvim",
	-- 	event = { "VimEnter" },
	-- },
	-- -- Auto-completion engine
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		"lspkind.nvim",
	-- 		"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
	-- 		"hrsh7th/cmp-buffer", -- buffer auto-completion
	-- 		"hrsh7th/cmp-path", -- path auto-completion
	-- 		"hrsh7th/cmp-cmdline", -- cmdline auto-completion
	-- 	},
	-- 	config = function()
	-- 		local has_words_before = function()
	-- 			unpack = unpack or table.unpack
	-- 			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- 			return col ~= 0
	-- 				and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	-- 		end
	--
	-- 		local luasnip = require("luasnip")
	-- 		local cmp = require("cmp")
	--
	-- 		cmp.setup({
	-- 			snippet = {
	-- 				-- REQUIRED - you must specify a snippet engine
	-- 				expand = function(args)
	-- 					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
	-- 				end,
	-- 			},
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				-- Use <C-b/f> to scroll the docs
	-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 				-- Use <C-k/j> to switch in items
	-- 				["<C-k>"] = cmp.mapping.select_prev_item(),
	-- 				["<C-j>"] = cmp.mapping.select_next_item(),
	-- 				-- Use <CR>(Enter) to confirm selection
	-- 				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
	--
	-- 				-- A super tab
	-- 				-- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
	-- 				["<Tab>"] = cmp.mapping(function(fallback)
	-- 					-- Hint: if the completion menu is visible select next one
	-- 					if cmp.visible() then
	-- 						cmp.select_next_item()
	-- 					elseif has_words_before() then
	-- 						cmp.complete()
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end, { "i", "s" }), -- i - insert mode; s - select mode
	-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_prev_item()
	-- 					elseif luasnip.jumpable(-1) then
	-- 						luasnip.jump(-1)
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end, { "i", "s" }),
	-- 			}),
	--
	-- 			-- Let's configure the item's appearance
	-- 			-- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
	-- 			formatting = {
	-- 				-- Set order from left to right
	-- 				-- kind: single letter indicating the type of completion
	-- 				-- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
	-- 				-- menu: extra text for the popup menu, displayed after "word" or "abbr"
	-- 				fields = { "abbr", "menu" },
	--
	-- 				-- customize the appearance of the completion menu
	-- 				format = function(entry, vim_item)
	-- 					vim_item.menu = ({
	-- 						nvim_lsp = "[Lsp]",
	-- 						luasnip = "[Luasnip]",
	-- 						buffer = "[File]",
	-- 						path = "[Path]",
	-- 					})[entry.source.name]
	-- 					return vim_item
	-- 				end,
	-- 			},
	--
	-- 			-- Set source precedence
	-- 			sources = cmp.config.sources({
	-- 				{ name = "nvim_lsp" }, -- For nvim-lsp
	-- 				{ name = "luasnip" }, -- For luasnip user
	-- 				{ name = "buffer" }, -- For buffer word completion
	-- 				{ name = "path" }, -- For path completion
	-- 			}),
	-- 		})
	-- 	end,
	-- },
	-- -- Code snippet engine
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	version = "v2.*",
	-- },
}

local opts = {
	ui = {
		icons = {
			cmd = "⌘",
			config = "🛠 ",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝 ",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
}
require("lazy").setup({ { import = "plugins" } })
