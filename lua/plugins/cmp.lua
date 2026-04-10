vim.pack.add({
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp"
})

local cmp = require("cmp")

local kind_icons = {
	Text = "󰊄",
	Method = "m",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰫧",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "󰌆",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "󰉺",
}

cmp.setup({
	-- Priority order
	sources = {
		{ name = "nvim_lsp" }, -- LSP cmp first
		{ name = "buffer" },
		{ name = "path" }
	},
	mapping = {
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-j>"]     = cmp.mapping.select_next_item(),
		["<C-k>"]     = cmp.mapping.select_prev_item(),
		["<CR>"]      = cmp.mapping.confirm { select = true }
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				luasnip = "[Snippet]",
				buffer  = "[Buffer]",
				path    = "[Path]",
			})[entry.source.name]
			return vim_item
		end
	}
})

require("cmp_nvim_lsp").default_capabilities()
