-- Backup
vim.opt.backup      = false         -- Make backup file
vim.opt.swapfile    = false         -- Make a swap file
vim.opt.clipboard   = "unnamedplus" -- Neovim acess clipboard
vim.opt.writebackup = false

-- Completion menu
vim.opt.completeopt = "menu,menuone,popup,fuzzy" -- menu, menuone, noselect, noinsert, preview
vim.opt.winborder = "rounded" -- rounded, single, double, none

-- Buffer
vim.opt.showtabline = 2     -- 0: never  / 1: only if there are at least two / 2: always
-- vim.opt.tabline     = ''    -- Default tabline
-- Tabs
vim.opt.autoindent  = true
vim.opt.smartindent = false  -- Use file indent
vim.opt.cindent     = false

vim.opt.expandtab   = false -- Convert tab to space
vim.opt.tabstop     = 4     -- Size of spaces as tab
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 0     -- Number of spaces inserted for each tab

-- Split
vim.opt.splitbelow = true -- Force horizontal splits to go below
vim.opt.splitright = true -- Force vertical splits to go right

-- Search
vim.opt.hlsearch   = true -- Highlight all previous matches
vim.opt.ignorecase = true -- Ignore case in search patterns

-- Mouse
vim.opt.mouse      = "a" -- Enable mouse

-- Relative line
vim.opt.number         = true -- Show line number (with relative lines this will show current line number isntead of '0')
vim.opt.relativenumber = true

-- Text
vim.opt.cursorline    = true   -- Highlight current line
vim.opt.colorcolumn   = "80"  -- Enable color column to 80 characters
vim.opt.wrap          = false -- Wrap text
vim.opt.signcolumn    = "yes" -- Always show the sign column
vim.opt.conceallevel  = 0     -- `` visible on markdown
vim.opt.termguicolors = true  -- True colors support

-- e.g. listchars = { eol = "$", tab = ">~", space = "·", extends = "#" },
vim.opt.listchars = { tab = "▏ ", space = "·", extends = "#", trail = "~", nbsp = "+" }
vim.opt.list      = true -- Use listchars

-- Behaviour
vim.opt.undofile  = true -- Enable persistent undo
vim.opt.path = "**"

-- vim.cmd("filetype plugin indent on")

-- Ignore default styles (ident)
vim.g.python_recommended_style = 0
vim.g.ruby_recommended_style = 0
vim.g.markdown_recommended_style = 0
vim.g.php_recommended_style = 0
vim.g.arduino_recommended_style = 0

