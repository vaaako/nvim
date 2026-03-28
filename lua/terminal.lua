-- Floating terminal state
local term = {
	buf = nil,
	win = nil,
}

local function is_valid_win(win)
	return win and vim.api.nvim_win_is_valid(win)
end

local function is_valid_buf(buf)
	return buf and vim.api.nvim_buf_is_valid(buf)
end

local function toggle_floating_terminal()
	-- Close if already open
	if is_valid_win(term.win) then
		vim.api.nvim_win_close(term.win, true)
		term.win = nil
		return
	end

	-- Create buffer once
	if not is_valid_buf(term.buf) then
		term.buf = vim.api.nvim_create_buf(false, true)
		vim.bo[term.buf].bufhidden = "hide"
		vim.bo[term.buf].filetype = "terminal"
	end

	-- Floating window size
	local width  = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row    = math.floor((vim.o.lines - height) / 2)
	local col    = math.floor((vim.o.columns - width) / 2)

	-- Open floating window
	term.win = vim.api.nvim_open_win(term.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Window appearance
	vim.wo[term.win].winblend = 0
	vim.wo[term.win].winhighlight =
	"Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder"

	-- Highlight groups (defined once)
	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })

	-- Start terminal only once
	if vim.b[term.buf].terminal_job_id == nil then
		vim.fn.termopen(vim.o.shell)
	end

	vim.cmd("startinsert")
end

-- Keymaps
vim.keymap.set({ "n", "t" }, "<C-/>", toggle_floating_terminal, {
	silent = true,
	desc = "Toggle floating terminal",
})

