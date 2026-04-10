require("plugins") -- Basic plugins install
require("options")
require("autocmd") -- Auto commands
require("keymaps")
require("lsp")
require("terminal")
require("statusline")
-- Install and config plugins
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.mini")
require("plugins.oil")


vim.cmd.hi("statusline guibg=NONE")
vim.cmd.colorscheme("gruber-darker")
