local common = require("lsp.common-config")
local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = function(client, bufnr)
		common.disableFormat(client)
		common.keyAttach(bufnr)

		local bufopts = { noremap = true, silent = true, buffer = bufnr }
	end,
}

return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
