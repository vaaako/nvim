return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".git"
	},
	settings = {
		Lua = {
			diagnostics = {
				-- globals = { "vim", "love" }
			},

			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				}
			}
		}
	}
}

