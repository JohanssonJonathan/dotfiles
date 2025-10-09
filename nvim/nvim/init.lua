require("user")

local cmp = require("cmp")
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
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
})
-- require("language-server-setup")
-- Enable diagnostics globally
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


-- Autostart tsserver and biome for relevant filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  callback = function()
    local root = vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json", ".git" }, { upward = true })[1])

    -- Start tsserver
    vim.lsp.start({
      name = "tsserver",
      cmd = { "typescript-language-server", "--stdio" },
      root_dir = root,
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    })

    -- Start biome
    vim.lsp.start({
      name = "biome",
      cmd = { "biome", "lsp-proxy" },
      root_dir = root,
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    })
  end,
})

-- Set up LSP keymaps when a server attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>kk", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
  callback = function(args)
    local bufnr = args.buf
    local biome = nil

    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
      if client.name == "biome" and client.supports_method("textDocument/formatting") then
        biome = client
        break
      end
    end

    if biome then
      vim.lsp.buf.format({ bufnr = bufnr, name = "biome" })
    end
  end,
})

