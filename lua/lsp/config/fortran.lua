local opts = {
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        -- Disable format; this should be handled by other plugins
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        
        require('keybindings').mapLSP(buf_set_keymap)
    end,
}

return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
