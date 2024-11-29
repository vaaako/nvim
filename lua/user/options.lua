-- :help options
local opt_lock_options = {
	-- Backup
	backup      = false,         -- Make backup file
	swapfile    = false,         -- Make a swap file
	clipboard   = "unnamedplus", -- Neovim acess clipboard
	writebackup = false,



	-- Tabs
	showtabline = 2,       -- Always show tabs on tabline
	shiftwidth  = 0,       -- Number of spaces inserted for each tab (0 to insert TAB)
	softtabstop = 4,
	tabstop     = 4,       -- Size of spaces as tab
	expandtab   = false,   -- Convert tab to space
	smartindent = false,   -- Use file indent
	autoindent  = true,



	-- Split
	splitbelow = true, -- Force horizontal splits to go below
	splitright = true, -- Force vertical splits to go right



	-- Search
	hlsearch   = true, -- Highlight all previous matches
	ignorecase = true, -- Ignore case in search patterns



	-- Mouse
	mouse      = "a",   -- Enable mouse
	cursorline = true, -- Highlight current line



	-- Relative line
	number         = true, -- Show line number (with relative lines this will show current line number isntead of '0')
	relativenumber = true,


	-- Colorcolumn
	colorcolumn = "80", -- Enable color column to 80px
	-- Go to colorscheme.lua to set this up


	-- Text
	guifont = "monospace:h17",
	wrap           = false, -- Wrap text
	signcolumn     = "yes", -- Always show the sign column
	conceallevel   = 0,     -- `` visible on markdown
	termguicolors  = true,  -- Use terminal colors

	-- e.g. listchars = { eol = "$", tab = ">~", space = "·", extends = "#" },
	listchars = { tab = ">—", space = "·", extends = "#" },
	list = true, -- Use listchars


	-- Behaviour
	undofile       = true,  -- Enable persistent undo
}

local g_lock_options = {
	-- Ignore styles (ident)
	python_recommended_style = 0,
	ruby_recommended_style = 0,
	markdown_recommended_style = 0,
	php_recommended_style = 0
}


-- Enable all options
for k, v in pairs(opt_lock_options) do
	vim.opt[k] = v
end

for k, v in pairs(g_lock_options) do
	vim.g[k] = v
end


-- Enable html for blade files, since treesitter doesn't work
-- This crashes neovim for some reason
vim.treesitter.language.register("html", "blade")

