local status, flutter_tools = pcall(require, "flutter-tools")
if not status then
	vim.notify("没有找到 flutter-tools")
end

flutter_tools.setup({
	lsp = {
		on_attach = function(client, bufnr)
			-- client.resolved_capabilities.document_formatting = false
			-- client.resolved_capabilities.document_range_formatting = false

			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			require("keybindings").mapLSP(buf_set_keymap)
		end,
	},
})
