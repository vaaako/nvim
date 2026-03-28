-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Colorscheme
		"https://github.com/blazkowolf/gruber-darker.nvim",

		-- Buffer
		"https://github.com/mg979/vim-visual-multi",
		-- Icons
		"https://github.com/nvim-tree/nvim-web-devicons",
		"https://github.com/lewis6991/gitsigns.nvim",

		-- LSP
		"https://github.com/mason-org/mason.nvim",
		"https://github.com/hrsh7th/nvim-cmp",
		"https://github.com/mason-org/mason-lspconfig.nvim", -- Just for "ensure_installed" feature
		"https://github.com/hrsh7th/cmp-nvim-lsp",
		-- Treesitter
		{
			"https://github.com/nvim-treesitter/nvim-treesitter",
			branch = "master",
			dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
			build = ":TSUpdate"
		},

		{
			"https://github.com/Wansmer/treesj",
			keys = { "<space>m", "<space>j", "<space>s" }, -- Change, Join, Split
			dependencies = { "nvim-treesitter/nvim-treesitter" }
		},

		{
			"https://github.com/MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", 'nvim-tree/nvim-web-devicons' },
			ft = { "markdown" }
		},

		-- mini.nvim
		"https://github.com/nvim-mini/mini.cursorword",
		"https://github.com/nvim-mini/mini.hipatterns",
		"https://github.com/nvim-mini/mini.notify",
		"https://github.com/nvim-mini/mini.pairs",
		"https://github.com/nvim-mini/mini.pick",
		"https://github.com/nvim-mini/mini.starter",
		"https://github.com/nvim-mini/mini.surround",

		-- Useless
		"https://github.com/andweeb/presence.nvim",
		{
			"https://github.com/sphamba/smear-cursor.nvim",
			opts = {
				stiffness = 0.8,
				trailing_stiffness = 0.5,
				distance_stop_animating = 0.5
			}
		}
	},

	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})


require("nvim-web-devicons").setup()
require('gitsigns').setup()


require("render-markdown").setup()
require('treesj').setup({
	max_join_length = 200
})

-- mini.nvim
require("mini.cursorword").setup() -- Highlight words under cursor
local hipatterns = require("mini.hipatterns")
hipatterns.setup({  -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOT
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme'},
		hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack' },
		todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo' },
		note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote' },
		-- Highlight hex color strings (`#rrggbb`) using that color
		-- Example: #ca1773
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
require("mini.notify").setup()     --
require("mini.pairs").setup()      -- Auto pairs
require("mini.pick").setup({
	options = {
		use_cache = false
	}
})
require("mini.starter").setup()    --
require("mini.surround").setup({
	custom_surroundings = {
		["s"] = { output = { left = "**", right = "**" } }
	},
	mappings = {
		add     = "S",  -- Add surrounding in normal and visual
		delete  = "sd", -- Delete surrounding
		replace = "sr"  -- Replace surrounding (what -> to)

	}
})


-- NOTE: mini.pick line highlight was not showing for me, this fixes it
vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "visual" })



-- Eyecandy plugins

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



