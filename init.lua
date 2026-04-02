--[[
NOTE: I wanted to use vim.pack but the feature to specify branch wasnt working for me,
and I needed the branch "master" from treesitter. So I had to use Lazy.nvim instead
--]]

require("plugins")
require("options")
require("autocmd")
require("keymaps")
require("statusline")
require("lsp")
-- Plugins config
require("plugins.confcmp")
require("plugins.treesitter")
-- Not plugins
require("plugins.terminal")
require("plugins.tabline")

vim.cmd.hi("statusline guibg=NONE")
vim.cmd.colorscheme("gruber-darker")

