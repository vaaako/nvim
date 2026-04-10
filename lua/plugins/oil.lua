vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	columns = {
		"size",
		"mtime",
		"icon"
	},
	buf_options = {
		buflisted = false -- Show buffer on tabline
	},
	view_options = {
		show_hidden = true
	},
	skip_confirm_for_simple_edits = true
})
