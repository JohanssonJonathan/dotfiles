require("user")

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local cmp = require("cmp")

lspconfig.tsserver.setup({
	capabilities = capabilities,
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

lspconfig.eslint.setup({
	capabilities = capabilities,
	--- ...
	-- on_attach = function(client, bufnr)
	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
	-- 		buffer = bufnr,
	-- 		command = "EslintFixAll",
	-- 	})
	-- end,
})
-- lspconfig.eslint.setup({
--
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
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach-format", { clear = true }),
	-- This is where we attach the autoformatting for reasonable clients
	callback = function(args)
		local client_id = args.data.client_id
		local client = vim.lsp.get_client_by_id(client_id)
		local bufnr = args.buf

		--
		-- if not client.server_capabilities.documentFormattingProvider then
		--           print("heeelooo")
		--           return
		-- end
		--
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		--           buffer = bufnr,
		--           callback = function()
		--                     vim.cmd("Format")
		--                     -- vim.lsp.buf.format({
		--                     --           async = false,
		--                     --           filter = function(c)
		--                     --                     return c.id == client.id
		--                     --           end,
		--                     -- })
		--           end,
		-- })
	end,
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
