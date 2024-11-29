	local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end


local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end


	local function get_extension(path)
		return path:match("^.+(%..+)$")
	end

	local function is_valid(ext)
		return ext == ".bmp" or ext == ".jpg" or ext == ".jpeg" or ext == '.png' or ext == '.gif'
	end

	-- This only works for kitty terminal
	local function image_nvimtree()
		local node = api.tree.get_node_under_cursor()
		local path = node.absolute_path
		local extension = get_extension(path)

		-- If is file and is a valid extension
		if not node.nodes and is_valid(extension) then
			vim.api.nvim_command("silent !kitty -o allow_remote_control=true kitten @ launch --type=window kitten icat --hold " .. path)
		else
			print("No image preview for file " .. path)
		end
	end

	-- Default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- Custom mappings
	vim.keymap.set('n', '?', api.diagnostics.hi_test, opts('Edit'))
	vim.keymap.set('n', "<leader>p", image_nvimtree, opts('Image Preview'))
end


nvimtree.setup({
	sort = {
		sorter = "case_sensitive"
	},

	view = {
		width = 25,
		adaptive_size = true,
		side = "left",
	},

	filters = {
		dotfiles = false -- Hide dot files
	},

	git = {
		enable = true,
		ignore = false -- Don't hide .gitignore status
	},


	-- Show diagnostics
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	-- Opened file focus
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {}
	},

	renderer = {

		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "	",
			}
		},

		-- Change git icons
		icons = {
			glyphs = {
				git = {
					unstaged = "U",
					staged = "S",
					unmerged = "UM",
					renamed = "R",
					deleted = "D",
					untracked = "",
					ignored = "I",
				}
			}
		}
	},


	-- My custom keymaps
	on_attach = on_attach
})

