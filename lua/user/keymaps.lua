-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c"

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap -- Shorten function name

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation -> Ctrl+[hjkl] to move between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts) -- Open File explorer



-- Resize with arrows -> Resize splits
keymap("n", "<C-k>", ":resize +1<CR>", opts)
keymap("n", "<C-j>", ":resize -1<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -1<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +1<CR>", opts)

-- Tabline / Buffers --
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<M-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<M-h>", ":BufferLineMovePrev<CR>", opts)



-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "kj", "<ESC>", opts)



-- Visual --
-- Ident and stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- Paste without yanking

-- Visual Block --
-- Move text up and down -> Shift+[JK] move line up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
