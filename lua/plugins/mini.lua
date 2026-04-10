vim.pack.add({
	"https://github.com/nvim-mini/mini.cursorword",
	"https://github.com/nvim-mini/mini.hipatterns",
	"https://github.com/nvim-mini/mini.notify",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.pick",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.tabline"
})


require("mini.cursorword").setup() -- Highlight words under cursor

-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		fixme = {
			pattern = '%f[%w]()FIXME()%f[%W]',
			group = 'DiagnosticError',
		},
		hack = {
			pattern = '%f[%w]()HACK()%f[%W]',
			group = 'DiagnosticWarn',
		},
		todo = {
			pattern = '%f[%w]()TODO()%f[%W]',
			group = 'DiagnosticInfo',
		},
		note = {
			pattern = '%f[%w]()NOTE()%f[%W]',
			group = 'DiagnosticHint',
		},
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

require("mini.notify").setup() --
require("mini.pairs").setup()  -- Auto pairs
require("mini.pick").setup({
	options = {
		use_cache = false
	},
	mappings = {
		choose            = "<C-t>",
		choose_in_tabpage = "<CR>",
		move_down         = '<C-j>',
		move_up           = '<C-k>'
	}
})
-- NOTE: mini.pick line highlight was not showing for me, this fixes it
vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "visual" })

require("mini.surround").setup({
	custom_surroundings = {
		["s"] = { output = { left = "**", right = "**" } }
	},
	mappings = {
		add     = "S", -- Add surrounding in normal and visual
		delete  = "sd", -- Delete surrounding
		replace = "sr" -- Replace surrounding (what -> to)

	}
})

require("mini.tabline").setup({
	tabpage_section = "none"
})
