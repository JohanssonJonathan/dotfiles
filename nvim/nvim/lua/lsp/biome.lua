local lspconfig = require("lspconfig")

lspconfig.biome = {
	default_config = {
		cmd = { "biome", "lsp-proxy" },
		filetypes = { "javascript", "typescript", "json" },
		root_dir = lspconfig.util.root_pattern("biome.json", ".git"),
		settings = {},
	},
}

return function()
	lspconfig.biome.setup({})
end
