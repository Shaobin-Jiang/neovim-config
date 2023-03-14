require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"cssls",
		"emmet_ls",
		"gopls",
		"html",
		"jsonls",
		"lua_ls",
		"pyright",
		"tsserver",
	},
})

local lspconfig = require("lspconfig")

local servers = {
	clangd = require("lsp.config.clangd"),
	cssls = require("lsp.config.css"),
	emmet_ls = require("lsp.config.emmet"),
	gopls = require("lsp.config.gopls"),
	html = require("lsp.config.html"),
	jsonls = require("lsp.config.json"),
	lua_ls = require("lsp.config.lua"),
	pyright = require("lsp.config.pyright"),
	tsserver = require("lsp.config.typescript"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		config.on_setup(lspconfig[name])
	else
		lspconfig[name].setup({})
	end
end
