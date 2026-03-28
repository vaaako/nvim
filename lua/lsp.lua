-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

local group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(ev)
		-- Set omnifunc to LSP's completion function
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Keymaps
		local opts = { buffer = ev.buf, silent = true, noremap = true }
		-- Navigation
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

		-- Documentation
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set("n", "gl", vim.diagnostic.setloclist, opts)
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

		-- Code actions
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)


		vim.keymap.set("i", "<c-space>", function()
			vim.lsp.completion.get()
		end)
	end
})

-- vim.lsp.enable({
-- 	"lua_ls"
-- })

local servers = {
	"lua_ls",
	"clangd",
	"ts_ls",
	"jdtls",
	"intelephense"
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true
})
vim.lsp.enable(servers)


vim.diagnostic.config({
	virtual_text = false, -- Show inline error message
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true
})

-- Automatically show popup when cursor moves to an error
-- vim.opt.updatetime = 500 -- 0.5 seconds
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	group = group,
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false })
-- 	end
-- })
