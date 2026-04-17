vim.pack.add({
	-- Colorscheme
	"https://github.com/blazkowolf/gruber-darker.nvim",
	-- Multi cursor
	"https://github.com/mg979/vim-visual-multi",
	-- Icons
	"https://github.com/nvim-tree/nvim-web-devicons",

	{
		src = "https://github.com/Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" }
	},

	{
		src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", 'nvim-tree/nvim-web-devicons' },
		ft = { "markdown" }
	},

	-- Useless
	"https://github.com/andweeb/presence.nvim",
	"https://github.com/sphamba/smear-cursor.nvim",
})

require("nvim-web-devicons").setup()
require("render-markdown").setup({
	enabled = false
})

require("treesj").setup({
	keys = { "<space>m", "<space>j", "<space>s" }, -- Change, Join, Split
	max_join_length = 200
})

require("smear_cursor").setup({
	opts = {
		stiffness = 0.8,
		trailing_stiffness = 0.5,
		distance_stop_animating = 0.5
	}
})

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
