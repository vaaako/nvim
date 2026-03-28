--[[
NOTE: I wanted to use vim.pack but the feature to specify branch wasnt working
for me, and I needed the branch "master" from treesitter. So I had to use Lazy.nvim instead

--]]

-- if vim.fn.has("nvim-0.12") == 0 then
-- 	vim.notify("This configuration only supports Neovim 0.12+", vim.log.levels.ERROR)
-- end

require("plugins")
require("options")
require("autocmd")
require("keymaps")
require("statusline")
require("lsp")
require("terminal")
-- Plugins config
require("plugins.confcmp")
require("plugins.treesitter")

vim.cmd.hi("statusline guibg=NONE")
vim.cmd.colorscheme("gruber-darker")

