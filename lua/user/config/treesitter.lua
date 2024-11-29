local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	-- ensure_installed = "maintainers", -- "all" For all langues, "maintained" For parsers with maintainers

	-- Add more servers here, search with :TSInstallInfo
	ensure_installed = {
		"lua",
		"markdown",
		"c",
		"cpp",
		"glsl",
		"java",

		"typescript",
		"python",
		"javascript",

		"ruby",
		"html",
		"css",
		"php"
	},

	sync_install = false, -- Install languages synchronously (only applied to "ensure_installed")
	-- ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
		-- disable = { "" }, -- List of language that will be disabled
	},

	indent = {
		enable = false,
	},

	-- Enable rainbow parentheses
	-- See: https://github.com/p00f/nvim-ts-rainbow
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight non-brackets delimiters like HTML tags
		max_file_lines = nil  -- Do not enable for files with more than n lines
		-- disable = { }
		-- colors = {}
		-- termcolors = {}
	}
})

