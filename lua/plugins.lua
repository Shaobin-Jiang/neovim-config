local packer = require("packer")
packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		use("folke/tokyonight.nvim")
		use("ellisonleao/gruvbox.nvim")

		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

		-- lualine
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")

		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use("LinArcX/telescope-env.nvim")

		use("glepnir/dashboard-nvim")

		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "p00f/nvim-ts-rainbow" })

		-- lsp
		use("williamboman/nvim-lsp-installer")
		use({ "neovim/nvim-lspconfig" })

		-- completion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/vim-vsnip")
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		use("rafamadriz/friendly-snippets")

		-- ui
		use("onsails/lspkind-nvim")
		use("lukas-reineke/indent-blankline.nvim")
		-- use('glepnir/lspsaga.nvim')
		use("tami5/lspsaga.nvim")
		use("karb94/neoscroll.nvim")
		use("dstein64/nvim-scrollview")

		-- format
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

		use("windwp/nvim-autopairs")

		use("numToStr/Comment.nvim")

		use("tpope/vim-surround")

		use("mbbill/undotree")

		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})

		use({
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
		})

		use("simrat39/symbols-outline.nvim")

		use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })

        use({
            "folke/todo-comments.nvim",
            branch = "neovim-pre-0.8.0",
        })

        use("xiyaowong/nvim-transparent")
	end,
	config = {
		max_jobs = 16,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
