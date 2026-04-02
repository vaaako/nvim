-- https://tduyng.com/blog/neovim-tabline-native/
--[[
Changes:
 - Colors
 - Show only file name
 - Remove keymaps
--]]

local M = {}

local SEP = ""
local CLOSE = ""
local NO_NAME = "[NO NAME]"

function M.set_highlights()
	-- Get colors from current colorscheme
	local normal  = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
	local tabline = vim.api.nvim_get_hl(0, { name = "TabLine", link = false })
	local tabsel  = vim.api.nvim_get_hl(0, { name = "TabLineSel", link = false })
	local comment = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
	local error   = vim.api.nvim_get_hl(0, { name = "DiagnosticError", link = false })

	-- Set colors dynamically
	vim.api.nvim_set_hl(0, "MyBufInactive",  { fg = comment.fg or normal.fg,       bg = tabline.bg or normal.bg })
	vim.api.nvim_set_hl(0, "MyBufActive",    { fg = tabsel.fg or normal.fg,        bg = tabsel.bg or normal.bg, bold = true })
	vim.api.nvim_set_hl(0, "MyBufSeparator", { fg = normal.bg,                     bg = tabline.bg or normal.bg })
	vim.api.nvim_set_hl(0, "MyBufClose",     { fg = (error or {}).fg or normal.fg, bg = tabsel.bg or normal.bg })
end

local function get_icon(filename, name)
	local ok, devicons = pcall(require, "nvim-web-devicons")
	if not ok or not name or name == "" then
		return ""
	end
	local ext = vim.fn.fnamemodify(name, ":e")
	local icon = devicons.get_icon(filename, ext, { default = true })
	return icon and (icon .. " ") or ""
end

local function get_display_name(path)
	if path == "" then
		return NO_NAME
	end
	local parts = vim.split(path, "/", { plain = true })
	return parts[#parts]
end

local function render_buf(bufnr, current)
	if not vim.api.nvim_buf_is_loaded(bufnr) then
		return ""
	end
	if not vim.bo[bufnr].buflisted then
		return ""
	end

	local name = vim.api.nvim_buf_get_name(bufnr)
	local display_name = get_display_name(name)
	local filename = (name ~= "" and vim.fn.fnamemodify(name, ":t")) or NO_NAME
	local icon = get_icon(filename, name)
	local content = icon .. display_name

	if bufnr == current then
		return table.concat({
			"%#MyBufActive# ",
			content,
			" %#MyBufClose#",
			CLOSE,
			" %#MyBufSeparator#",
			SEP,
		})
	else
		return table.concat({
			"%#MyBufInactive# ",
			content,
			"  %#MyBufSeparator#",
			SEP,
		})
	end
end

function M.tabline()
	local current = vim.api.nvim_get_current_buf()
	local parts = {}

	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		local chunk = render_buf(bufnr, current)
		if chunk ~= "" then
			table.insert(parts, chunk)
		end
	end

	if #parts == 0 then
		return ""
	end
	return table.concat(parts):gsub(vim.pesc(SEP) .. "$", "")
end

function _G.tabline()
	local current = vim.api.nvim_get_current_buf()
	local parts = {}

	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		local chunk = render_buf(bufnr, current)
		if chunk ~= "" then
			table.insert(parts, chunk)
		end
	end

	if #parts == 0 then
		return ""
	end

	local line = table.concat(parts)
	return line:gsub(vim.pesc(SEP) .. "$", "")
end

function M.setup()
	M.set_highlights()

	vim.api.nvim_create_augroup("MyTabline", { clear = true })
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = "MyTabline",
		callback = M.set_highlights,
	})

	vim.opt.showtabline = 2
	vim.opt.tabline = "%!v:lua.tabline()"
end

M.setup()
