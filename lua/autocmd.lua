local usergroup = vim.api.nvim_create_augroup("UserConfig", {})
local numgroup = vim.api.nvim_create_augroup("NumberToggle", { clear = true })

-- Enable html for blade files, since treesitter doesn't work
vim.treesitter.language.register("html", "blade")

-- Highlight yanked
vim.api.nvim_create_autocmd("TextYankPost", {
	group = usergroup,
	callback = function()
		-- Highlight yank with visual style
		-- 200ms
		vim.highlight.on_yank({ higroup = "visual", timeout = 200 })
	end
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = usergroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end
})

-- Enter Insert mode and disable relative number
vim.api.nvim_create_autocmd({ "FocusGained", "InsertEnter" }, {
	group = numgroup,
	callback = function()
		vim.opt.relativenumber = false
	end
})

-- Leave Insert mode and disable relative number
vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave", "FocusLost", "InsertLeave" }, {
	group = numgroup,
	callback = function()
		vim.opt.relativenumber = true
	end
})


vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		print("LSP attached:", vim.lsp.get_client_by_id(ev.data.client_id).name)
	end,
})


