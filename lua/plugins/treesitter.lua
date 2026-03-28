-- require("nvim-treesitter").install({
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
-- 		"css",
-- 		"javscript"
-- })

require("nvim-treesitter.configs").setup({
	ensure_installed = {
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
	},
	sync_install = false, -- Install languages synchronously
	highlight = {
		enable = true
	},
	-- No indent just for colors
	indent = {
		enable = false
	}
})

-- -- Start treesitter
-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	callback = function(args)
-- 		if vim.api.nvim_buf_is_loaded(args.buf) then
-- 			pcall(vim.treesitter.start, args.buf)
-- 		end
-- 	end
-- })
