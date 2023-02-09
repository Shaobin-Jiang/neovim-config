-- vim.api.nvim_set_keymap('mode', 'keys', 'map-to', 'options')
-- mode: n - Normal, i - Insert, v - Visual, t - Terminal, c - Command
-- options: noremap = true means do not map (A -> B, B -> C) to (A -> C)

-- Store the command for mapping and the option to local variables for repeated use
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Black hole register
-- See `:h quote_`
map("n", "\\", "\"_", opt)

-- Select configuration file
map("n", "<leader>cfg", ":e ~\\AppData\\Local\\nvim\\", { noremap = true })

-- Map ctrl-z to undo in normal / insert / visual modes
map("n", "<C-z>", "<Esc>:u<CR>", opt)
map("i", "<C-z>", "<Esc>:u<CR>", opt)
map("v", "<C-z>", "<Esc>:u<CR>", opt)
map("t", "<C-z>", "<Nop>", opt)
map("c", "<C-z>", "<Nop>", opt)

-- Window management: starting with s
map("n", "s", "", opt) -- Disable current mapping of s
map("n", "sV", ":vsp<CR>", opt) -- Vertical split
map("n", "sH", ":sp<CR>", opt) -- Horizontal split
map("n", "sc", "<C-w>c", opt) -- Close current window
map("n", "so", "<C-w>o", opt) -- Close all windows but the current
map("n", "sh", ":vertical resize -10<CR>", opt) -- Decrease current vertical split width
map("n", "sl", ":vertical resize +10<CR>", opt) -- Increase current vertical split width
map("n", "sj", ":resize -5<CR>", opt) -- Decrease current horizontal split height
map("n", "sk", ":resize +5<CR>", opt) -- Increase current horizontal split height
map("n", "s=", "<C-w>=", opt) -- Equal size

-- Using Alt + h / j / k / l to move between windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- Terminal setting
-- The configuration for closing the terminal is at the Bufferline section
map("n", "<C-t>", ":sp | term powershell<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)

-- Visual setting
-- Indenting
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- Move selected content
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- Saving files
map("n", "<C-s>", ":w<CR>", opt)
map("i", "<C-s>", "<Esc>:w<CR>", opt)
map("v", "<C-s>", "<Esc>:w<CR>", opt)

-- Wrap
map("n", "<leader>wr", ":set wrap<CR>", opt)
map("n", "<leader>uwr", ":set nowrap<CR>", opt)
map("n", "<leader>lbr", ":set linebreak<CR>", opt)
map("n", "<leader>ulb", ":set nolinebreak<CR>", opt)

-- Run html files
RunHtmlFile = function ()
    if vim.bo.filetype == "html" then
        vim.cmd("!explorer %")
    end
end
map("n", "<A-b>", ":lua RunHtmlFile()<CR><Esc>", opt)

-- Plugin-related key bindings
local pluginKeys = {}

-- Nvim-tree
-- Toggle nvim tree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
	-- Open file / folder
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- Open file in split window
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- Show hidden files
	{ key = "i", action = "toggle_custom" }, -- Toggle files assigned in nvim-tree filters.custom
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

-- Bufferline
-- Switching between tabs
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- Closing tabs
-- map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
CloseCurrentTab = function ()
    if (vim.bo.buftype == "terminal") then
        vim.cmd("Bdelete!")
        vim.cmd("close")
        -- vim.cmd("call feedkeys(\"sc\")")
    else
        vim.cmd("Bdelete!")
    end
end
-- Add :<Esc> to erase the potential error message if current window is the last
map("n", "<C-w>", ":lua CloseCurrentTab()<CR>:<Esc>", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt) -- Search for files
map("n", "<leader><C-f>", ":Telescope live_grep<CR>", opt) -- Search for content
map("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", opt)
map("n", "<C-k><C-t>", ":Telescope colorscheme<CR>", opt) -- Preview color scheme
pluginKeys.telescopeList = {
	i = {
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		["<C-c>"] = "close",
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}
map("n", "<leader>env", ":Telescope env<CR>", opt) -- Inspect env variables

-- Nvim-treesitter
-- map("n", "<leader><A-f>", "gg=G", opt) -- Indenting for the entire file
map("n", "<leader>fd", "zc", opt) -- Fold
map("n", "ufd", "zo", opt) -- Unfold

-- Lsp
-- Mapping without lspsaga
-- pluginKeys.mapLSP = function(mapbuf)
--   -- rename
--   mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
--   -- code action
--   mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
--   -- go xx
--   mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
--   mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
--   mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
--   mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
--   -- diagnostic
--   mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
--   mapbuf('n', 'gk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
--   mapbuf('n', 'gj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
-- end

-- Refrain from using gj and gk for mapping, because they are used for navigation in wrapped lines
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- diagnostic
	mapbuf("n", "gP", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end

-- Cmp
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
pluginKeys.cmp = function(cmp)
	return {
		-- Show completion
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- Cancel
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- Confirm
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- Allow scroll
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		-- Use tab and shift + tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	}
end

-- Comment
pluginKeys.comment = {
	-- Normal
	toggler = {
		line = "gcc",
		block = "gbc",
	},
	-- Visual
	opleader = {
		line = "gc",
		block = "gb",
	},
	extra = {
		---Add comment on the line above
		above = "gcO",
		---Add comment on the line below
		below = "gco",
		---Add comment at the end of line
		eol = "gcA",
	},
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = true,
		---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
		extended = false,
	},
}

-- UndoTree
map("n", "<leader>udt", ":UndotreeToggle<CR>", opt)

-- Markdown Preview
ToggleMarkdownPreview = function ()
    if vim.bo.filetype == "markdown" then
        vim.cmd("MarkdownPreviewToggle")
    end
end
map("n", "<leader>mdp", ":lua ToggleMarkdownPreview()<CR>", opt)

-- Hop
map("n", "<leader>hp", ":HopWord<CR>", opt)

-- Symbols outline
pluginKeys.outline = {
    close = { "<Esc>" },
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "<leader>rn",
    code_actions = "<leader>ca",
    fold = "<leader>fd",
    unfold = "ufd",
    fold_all = "fda",
    unfold_all = "ufa",
    fold_reset = "R",
}
map("n", "<leader>otl", ":SymbolsOutline<CR>", opt)

return pluginKeys
