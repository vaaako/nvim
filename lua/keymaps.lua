--[[
Modes:
normal = "n",
insert = "i",
visual = "v",
visual block = "x",
terminal mode = "t",
command moded = "c"
]]--


local keymap = vim.api.nvim_set_keymap -- Shorten function name
local opts   = { noremap = true, silent = true }
-- Leader Key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Utilities
keymap("n", "<leader>p", ":RenderMarkdown toggle<cr>", opts)
keymap("n", "<leader>o", ":update<cr> :source<cr>", opts)
keymap("x", "<leader>nl", "!nl -w1 -s.<cr>", opts) -- Insert numbers


-- Navigate splits with Ctrl
keymap("n", "<C-H>", "<C-w>h", opts)
keymap("n", "<C-J>", "<C-w>j", opts)
keymap("n", "<C-K>", "<C-w>k", opts)
keymap("n", "<C-L>", "<C-w>l", opts)

keymap("n", "Y", "y$<CR>", opts)

-- File
keymap("n", "<leader>w", ":write<cr>", opts)
-- keymap("n", "<leader>q", ":quit<cr>", opts)
keymap("n", "<leader>q", ":bdelete<cr>", opts)
keymap("n", "<leader>aq", ":qall<cr>", opts)
keymap("n", "<leader>r", ":nohlsearch<cr>", opts)
keymap("n", "<leader>e", ":Tex<CR>", opts) -- Open in new tab
keymap("n", "<leader>x", ":copen<CR>", opts)

-- Navigation tabs
-- keymap("n", "<S-l>", ":tabnext<cr>", opts)
-- keymap("n", "<S-h>", ":tabprevious<cr>", opts)
-- keymap("n", "<M-l>", ":tabmove +1<CR>", opts)
-- keymap("n", "<M-h>", ":tabmove -1<CR>", opts)
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprev<cr>", opts)
-- keymap("n", "<M-l>", ":tabnext<cr>", opts)
-- keymap("n", "<M-h>", ":tabprevious<cr>", opts)
keymap("n", "<leader>nt", ":tabnew<cr>", opts)

-- Search
keymap("n", "<leader>ff", ":Pick files<cr>", opts)
keymap("n", "<leader>fg", ":Pick grep<cr>", opts)
vim.keymap.set("n", "<leader>fs", function()
	vim.lsp.buf.workspace_symbol(vim.fn.input("Symbol: "))
end)
-- Search
-- vim.keymap.set("n", "<leader>ff", ":find ")
-- vim.keymap.set("n", "<leader>fg", ":grep ")
vim.cmd("command! -nargs=+ NewGrep execute 'silent grep! <args>' | copen")

-- Buffer
keymap("n", "<leader>sv", ":vsplit<cr>", opts)
keymap("n", "<leader>sh", ":split<cr>", opts)
-- Navigation tabs
keymap("n", "<S-h>", ":tabprevious<CR>", opts)
keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<leader>n", ":tabnew<CR>", opts)
-- Resize splits with Ctrl + arrows
keymap("n", "<C-Up>", ":resize +1<CR>", opts)
keymap("n", "<C-Down>", ":resize -1<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)

-- VISUAL
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text in visual mode
keymap("v", "p", '"_dP', opts) -- Paste without yanking

-- VISUAL BLOCK
-- Move text
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)



-- Terminal

-- Navigate terminal
keymap("t", "<ESC>", "<C-\\><C-n>", opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)


keymap("n", "<leader>b", ":bot :term<CR> :resize 10<CR>i", opts)
keymap("n", "<leader>t", ":tabnew | :term<CR>i", opts)
-- Go to open terminal, Re-run last command, Go back to window above
-- vim.keymap.set("n", "<leader>r", "<C-\\><C-n><C-w>ji<Up><Enter><C-\\><C-n><C-\\><C-n><C-w>k")
vim.keymap.set("n", "<leader>r", function()
	-- local current_win = vim.api.nvim_get_current_win()
	-- Find an existing terminal window
	local term_win = nil
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "terminal" then
			term_win = win
			break
		end
	end

	-- If found go to it
	if term_win then
		vim.api.nvim_set_current_win(term_win)
	else
		vim.cmd("botright split | terminal")
		vim.cmd("resize 10")
		term_win = vim.api.nvim_get_current_win()
	end

	-- Enter insert mode and send command
	vim.cmd("startinsert")
	vim.api.nvim_input("<Up><CR><Esc><S-g>")
end)
