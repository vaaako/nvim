require("user.options")
require("user.keymaps")
require("user.colorscheme")

-- [!] Change colorscheme here
-- local colorscheme = "tokyonight-night"
-- local colorscheme = "catppuccin-mocha"
-- local colorscheme = "dracula"
-- local colorscheme = "material-deep-ocean"
local colorscheme = "ofirkai-darkblue"


local plugins = require("user.plugins")
plugins.config.plugins = {
	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		event = 'VeryLazy',
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = "markdown", -- Markdown files only
		build = function() vim.fn["mkdp#util#install"]() end
	},

	-- Updating symbol usages when renaming or moving a file in nvim-tree
	{
		'simaxme/java.nvim',
		event = "VeryLazy",
		ft = "java",
		config = function()
			require("java").setup()
		end
	},

	-- Screenshot code
	{
		-- https://github.com/michaelrommel/nvim-silicon?tab=readme-ov-file#setup
		"michaelrommel/nvim-silicon",
		event = 'VeryLazy',
		cmd = "Silicon",
		config = function()
			require("silicon").setup({
				to_clipboard = false,
				font = "JetBrainsMonoNL Nerd Font=34; Noto Color Emoji=34",
				theme = "Dracula", -- Run "silicon --help" on terminal to view more themes
				window_title = function()
					return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ':t')
				end
			})
		end
		-- sudo pacman -S silicon
	},

	-- Character and emoji picker
	{
		"ziontee113/icon-picker.nvim",
		event = 'VeryLazy',
		dependencies = {
			"stevearc/dressing.nvim"
		},
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })
		end
	},

	---- Highlight comment words
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",

		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				signs = true, -- Show signs,

				highlight = {
					multiline = true,
					pattern = [[.*<(KEYWORDS):]], -- Match: "KEYWORDS:" including the colon
				},

				-- INFO -- Some colorschemes may affec tcolors
				keywords = {
					TODO = { icon = " ", color = "default" },
				},

				-- INFO -- If termgui is enabled, terminal colors will be used instead
				colors = {
					error   = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
					info    = { "DiagnosticInfo", "#2563EB" },
					hint    = { "DiagnosticHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test    = { "Identifier", "#FF00FF" }
				},
			})
		end,
	},

	-- Discord RPC
	{
		"andweeb/presence.nvim", -- Sometimes works, sometimes not
		event = "VeryLazy",

		config = function()
			require("presence").setup({
				auto_update         = true,
				-- log_level = "debug",

				main_image          = "file",
				buttons             = false,
				-- enabled_line_number = true,

				editing_text        = "Editing %s",
				file_explorer_text  = "Browsing %s",
				reading_text        = "Reading %s",
				workspace_text      = "Working on %s",
				line_number_text    = "Line %s out of %s",

				git_commit_text     = "Committing changes",
				plugin_manager_text = "Managing plugins"
			})
		end
	},

	-- Colorschemes
	"folke/tokyonight.nvim",
	"Mofiqul/dracula.nvim",
	"catppuccin/nvim",
	"marko-cerovac/material.nvim",
	"ofirgall/ofirkai.nvim"

	-- INFO -- Config other plugins

	-- Lazy
	-- Updating plugins: Press "<leader>pu"

	-- LSP
	-- If you want a new server, add to "lsp/mason.lua"
	-- and config file (optional) to "lsp/settings/"

	-- Treesitter
	-- If you want treesitter to some language, add it to "config/treesitter.lua"

	-- Plugin with big config file
	-- Add config file to "config/" (see other configs to see how it's done) and import here
}

-- Add more options if you want
plugins.config.lazy_config = {
	defaults = {
		lazy = true, -- Load plugins just after nvim opens
		-- Significally increases startup time
		-- Some plugins may not work with this option enabled
	}
}


-- Load and sync plugins
plugins.sync_plugins()


-- Be sure to add plugins config after loading the plugins
-- Plugins configs
require("user.cmp")
require("user.lsp") -- Credits: https://github.com/LunarVim/Neovim-from-scratch
require("user.config.bufferline")
require("user.config.lualine")
require("user.config.nvimtree")
require("user.config.telescope")
require("user.config.treesitter")
require("user.config.toggleterm")
require("user.config.whichkey")

-- Use colorscheme
-- Add a second argument for background opacity (e.g. set_colorscheme((colorscheme, 80))
-- INFO -- If termgui on options.lua is enabled, opacity is set by terminal
require("user.colorscheme").set_colorscheme(colorscheme)
