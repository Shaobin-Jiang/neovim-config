local status, comment = pcall(require, "todo-comments")
if not status then
	vim.notify("没有找到 todo-comments")
end

comment.setup({})

vim.keymap.set("n", "<leader>nt", function()
	comment.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>pt", function()
	comment.jump_prev()
end, { desc = "Previous todo comment" })

vim.api.nvim_set_keymap("n", "todo", ":TodoTelescope<CR>", { noremap = true, silent = true })
