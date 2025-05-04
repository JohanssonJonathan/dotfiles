
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local cmp = require("cmp")

print("triggered")

lspconfig.biome.setup({
	cmd = { "biome", "lsp-proxy" },
	filetypes = { "javascript", "typescript", "json", "typescriptreact" },
	root_dir = require("lspconfig").util.root_pattern("biome.json", "package.json", ".git"),
})

lspconfig.graphql.setup({
	cmd = { "graphql-lsp", "server", "-m", "stream" },
	-- I do not need it in other filetypes, adjust for your needs
	filetypes = { "graphql" },
	root_dir = lspconfig.util.root_pattern(".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
				},
			},
		},
	},
})

-- lspconfig.eslint.setup({
-- 	capabilities = capabilities,
-- })

cmp.setup({
	snippet = {
		expand = function(args)
			local luasnip = require("luasnip")
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
		["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
