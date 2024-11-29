local wk = require("which-key")

local mappings = {
	{
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Browse Files" },
		{ "<leader>h", "<cmd>ToggleTerm direction=horizontal size=10<cr>", desc = "Open Horizontal Terminal" },
		{ "<leader>q", "<cmd>bdelete<cr>", desc = "Close Buffer" },
		{ "<leader>r", "<cmd>nohlsearch<cr>", desc = "Remove search selection" },
		{ "<leader>w", "<cmd>w<cr>", desc = "Save Buffer" },

		-- Buffer
		{ "<leader>b", group = "buffer" },
		{ "<leader>bc", "<cmd>close<cr>", desc = "Close buffer tab" },
		{ "<leader>bf", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
		{ "<leader>bh", "<cmd>hsplit<cr>", desc = "Horizontal split" },
		{ "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move to the right" },
		{ "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move to the left" },
		{ "<leader>bv", "<cmd>vsplit<cr>", desc = "Vertical split" },

		-- Telescope
		{ "<leader>f", group = "telescope" },
		{ "<leader>fa", "<cmd>Telescope live_grep<CR>", desc = "Serch string in all files" },
		{ "<leader>fb", "<cmd>Telescope buffers", desc = "Search opened tabs" },
		{ "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", desc = "Find sile" },
		{ "<leader>fp", "<cmd>Telescope find_files<cr>", desc = "Find file with preview" },
		{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search string in file" },

		-- Tabident
		{ "<leader>i", group = "tabident" },
		{ "<leader>i2", "<cmd>%s/^ /\t/g<cr>", desc = "2 spaces ident" },
		{ "<leader>i3", "<cmd>%s/^ /\t/g<cr>", desc = "3 spaces ident" },
		{ "<leader>i4", "<cmd>%s/^ /\t/g<cr>", desc = "4 spaces ident" },
		{ "<leader>ie", "<cmd>%s/ /\t/g<cr>", desc = "All 2 spaces to Tab" },

		-- LSP
		{ "<leader>l", group = "lsp" },
		{ "<leader>lF", desc = "Format" },
		{ "<leader>la", desc = "View all possible actions" },
		{ "<leader>lf", desc = "Quick Fix" },
		{ "<leader>li", desc = "Current LSP info" },
		{ "<leader>lj", desc = "Diagnostic go to next" },
		{ "<leader>lk", desc = "Diagnostic go to prev" },
		{ "<leader>lq", desc = "View all problems location" },
		{ "<leader>lr", desc = "Rename symbol (e.g. namespace, macro)" },
		{ "<leader>ls", desc = "Signature help" },

		-- Picker
		{ "<leader>p", group = "picker" },
		{ "<leader>pe", ":IconPickerInsert emoji<cr>", desc = "Emoji picker" },
		{ "<leader>pp", ":IconPickerNormal<cr>", desc = "Icon picker" },
	}
}

local visual_mappings = {
	{
		mode = { "v" },
		{ "<leader>s", group = "silicon" },
		{ "<leader>sc", function() require("nvim-silicon").shoot() end, desc = "Copy code screenshot to clipboard" },
		{ "<leader>sf", function() require("nvim-silicon").file() end, desc = "Save code screenshot as file" },
		{ "<leader>ss", function() require("nvim-silicon").clip() end, desc = "Create code screenshot" },
	}
}


wk.add(mappings)
wk.add(visual_mappings)
