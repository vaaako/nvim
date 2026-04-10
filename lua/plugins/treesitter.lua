vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main"
	}
})
-- npm install -g tree-sitter-cli

local nvt = require("nvim-treesitter")
local parsers = {
	"lua",
	"markdown",
	"c",
	"cpp",
	"glsl",
	"java",

	"typescript",
	"python",

	"html",
	"css"
}

-- Ensure all parsers are updated
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == 'nvim-treesitter' and kind == 'update' then
		if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
		vim.cmd('TSUpdate')
	end
end })


nvt.setup({
	install_dir = vim.fn.stdpath('data') .. '/site',
})

nvt.install(parsers)

-- enable highlighting via Neovim API (NOT via treesitter config anymore)
vim.api.nvim_create_autocmd('FileType', {
	pattern = parsers,
	callback = function()
		vim.treesitter.start()
	end
})


-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = {
-- 		"lua",
-- 		"markdown",
-- 		"c",
-- 		"cpp",
-- 		"glsl",
-- 		"java",
--
-- 		"typescript",
-- 		"python",
--
-- 		"html",
-- 		"css"
-- 	},
-- 	sync_install = false, -- Install languages synchronously
-- 	highlight = {
-- 		enable = true
-- 	},
-- 	-- No indent just for colors
-- 	indent = {
-- 		enable = false
-- 	}
-- })
