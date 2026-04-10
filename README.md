# Minimal Neovim
This is my minimal neovim setup

# Some Plugins
- Some [mini.nvim](https://github.com/nvim-mini)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Mason](https://github.com/mason-org/mason.nvim)
- [Multi cursor](https://github.com/mg979/vim-visual-multi)
- [Render Markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)

No `nvim-lspconfig`

## Requirements
- Neovim 0.12+
- npm
- tree-sitter-cli
	+ `npm install -g tree-sitter-cli`

## Installation
- Backup your current neovim

```sh
git clone https://github.com/vaaako/nvim ~/.config/nvim && nvim
```

# Keymaps
Check [keymaps.lua](lua/keymaps.lua) for general keymaps and [lsp.lua](lua/lsp.lua) for LSP related


