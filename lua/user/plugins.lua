-- Automatically install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if Lazy is installed
if not vim.loop.fs_stat(lazypath) then
	-- git clone to path
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Latest stable
		lazypath,
	})

	print("Installing Lazy.nvim close and reopen Neovim...")
end
vim.opt.rtp:prepend(lazypath)

local lock_plugins = {
	-- Necessary Plugins
	-- WARNING: Don't remove any of the plugins below
	"nvim-lua/popup.nvim",         -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim",       -- Useful lua functions used ny lots of plugins
	"nvim-tree/nvim-web-devicons", -- Tabline icons

	-- Completion Plugins
	"hrsh7th/nvim-cmp",         -- Completion plugin
	"hrsh7th/cmp-buffer",       -- Buffer completion
	"hrsh7th/cmp-path",         -- Path completion
	"hrsh7th/cmp-nvim-lsp",     -- LSP cmp
	"saadparwaiz1/cmp_luasnip", -- Snippet completion

	-- Snippets
	"L3MON4D3/LuaSnip",             -- Snippet engine
	"rafamadriz/friendly-snippets", -- A bunch of snippets

	-- LSP
	"neovim/nvim-lspconfig",             -- Enable LSP
	"williamboman/nvim-lsp-installer",   -- Simple to use language server installer
	"williamboman/mason.nvim",           -- Simple to use language server installer
	"williamboman/mason-lspconfig.nvim", -- Simple to use language server installer
	"jose-elias-alvarez/null-ls.nvim",   -- LSP diagnostics and code actions
	"onsails/lspkind.nvim",              -- vscode-like pictograms

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim", -- View files with telescope (not supported on all terminals)

	-- Treesiter
	-- Better syntax highlight
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects"
		},
		run = ":TSUpdate"
	},


	-- Optionals
	-- INFO: You can remove or edit any plugin below

	-- Tabline
	"akinsho/bufferline.nvim", -- Tabline
	"lewis6991/gitsigns.nvim", -- Tabline git status

	-- Treesiter
	"p00f/nvim-ts-rainbow",

	"JoosepAlviste/nvim-ts-context-commentstring", -- What style of comment to use on the cursor location (ex: html inside style tag and script tag)

	-- Customization
	"akinsho/toggleterm.nvim",                     -- Floating terminal (keymap: Ctrl + /)
	"nvim-lualine/lualine.nvim",                   -- Better bottom line


	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		lazy = false, -- Need to load on startup to work
		config = function()
			require("nvim-surround").setup({
				surrounds = {
					-- strong
					["s"] = {
						add = function()
							return { { "**" }, { "**" } }
						end
					}
				}
			})
		end
	},

	-- HTML autopair
	{
		"windwp/nvim-ts-autotag",
	},

	-- Highlight matching words under cursor
	{
		"xiyaowong/nvim-cursorword",
		lazy = false -- Need to load on startup to work
	},

	-- Multiple cursors like sublime
	{
		"terryma/vim-multiple-cursors",
		lazy = false
	},

	-- Show leader commands
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"echasnovski/mini.icons"
		}
	},

	-- File navigation
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		}
	},

	-- Autoclose (), {}, "" etc
	{
		"m4xshen/autoclose.nvim",
		lazy = false,
		config = function()
			require("autoclose").setup()
		end
	},

	-- Highlight colors like #CA1773
	{
		"NvChad/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require("colorizer").setup({
				filetypes = {
					"css",
					"scss",
					"html",
					"javascript",
					"typescript",
					"json"
				}
			})
		end,
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		event = 'VeryLazy',
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = "markdown", -- Markdown files only
		build = function() vim.fn["mkdp#util#install"]() end
	},

	-- Highlight yank
	{
		"gbprod/yanky.nvim",
		lazy = false,
		config = function()
			require("yanky").setup()
		end
	},

	-- Comment (keymap: gcc)
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end
	}
}



local config = {
	plugins = {},
	lazy_config = {}
}

local function sync_plugins()
	-- Add lock_plugins to plugins table to sync all
	for _, value in pairs(lock_plugins) do
		table.insert(config.plugins, value)
	end

	-- Load all plugins and config
	require("lazy").setup(config.plugins, config.lazy_config)
end


return {
	config = config,
	sync_plugins = sync_plugins
}
