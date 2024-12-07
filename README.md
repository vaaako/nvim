# Neovim Setup

# About
This is my basic `Neovim` setup, is **Lightweight**, **Customizable** and **Simple**

## Some Plugins
- Auto closing with [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Nerd icons with [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- File browsing with [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- File searching with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Built in terminal with [togleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- Git info with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Better syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- LSP configuration with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [mason.nvim](https://github.com/williamboman/mason.nvim)


# Install
## Requirements
- Neovim
- NPM
- Some [Nerd Font](https://www.nerdfonts.com/)
- RipGrep if you want to search for strings with `Telescope`


## Install
First make a backup of your current **Neovim** config *(it will be deleted)*

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

Delete old **Neovim** setup
```sh
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

Now run the following command:
```sh
git clone https://github.com/vaaako/nvim ~/.config/nvim && nvim
```

Plugins should start to install

> [!NOTE]
> You may have some trouble with **LSPs**

## Uninstall
```sh
rm -rf ~/.config/nvim      # Remove configs
rm -rf ~/.local/share/nvim # Remove plugins
```


# Controls
Leader key: `Space`

You can easily view the commands by pressing a key and waiting a bit *(including the leader key)*

These are some of the most important commands

## Completion Navigation
- `Enter`: Confirm selection
- `Ctrl + e`: Closes the snippet window
- `TAB`: Progresses to the next snippet location *(after selecting a snippet)*
	+  In snippet window acts like `Ctrl + j`
- `Ctrl + Space`: Forces completion window to show up
- `Ctrl + [j | k]`: Moves up and down between snippets
- `Ctrl + /`: Open a terminal inside **neovim**

## Multicursor
- `Ctrl + n`: Starts a *virtual cursor* to the word under the cursor or the selected word
    + `Ctrl + n`: Again to go to the next selection
- `Ctrl + x`: Skip the next match
- `Ctrl + p`: Remove current *virtual cursor* and got back to the previous
- `Alt + a`: Select all matches

After selecting with multicursor, you can press `c`, `s`, `v`, `I` or `A` to start some mode

Select multiple lines in visual mode, and press `Ctrl + n` to start a *visual cursor* splitted on each line

## LSP
- `gl`: Show full error message
- `gf`: Open the file of the file path under cursor
- `gD`: Open the file of the **method/object** declaration under the cursor
- `Shift + K`: Show definition of a **method/object** under cursor, press again to enter on the hint window
- `<leader> + q`: Use quick fix, when avaiable
- `<leader> + l + q`: View all problems in file


# Custom Configuration
Configuration files reside in `~/.config/nvim`, with every file located in the `lua/user` directory *(except `init.lua`)*

## Colorscheme
To change the colorscheme, modify on `init.lua` *(last lines)*

## LSP
You can download a new server by running the command: `:MasonInstall <servername>` or executing the command: `:Mason` and pressing `Shift + I` to install the desired server *(`Shift + X` to uninstall)*

Alternativally you can add the server name to `lua/user/lsp/mason.lua` and updating `Mason`

If you want to add a config file, add to `lua/user/lsp/settings`, the file must have the same name as the server

You can see all server's names with the command `:Mason`. Be aware some servers's *"true name"* are the gray name on the right of the server's name

## Treesitter
Add a new language with the command: `TSIntall <language>` or adding to `lua/user/config/treesitter.lua`

## Keymap and Whichkey
You can change keymaps on `lua/user/keymaps.lua` and `lua/user/config/whichkey.lua`

Use `keymaps.lua` to change common keymaps and `whichkey.lua` to change leader keymaps

## Plugins
- Desired plugins can be added in `init.lua`
- Optionally, adjust plugins in `plugin.lua`
- Plugins are automatically updated and installed when restarting **Neovim**


For plugin configuration, utilize the following format:
```lua
require("author/plugin_name")
```

But some plugins are required to use a *setup* to work

```lua
{
	"author/plugin_name",
	config = function()
		require("plugin_name").setup({ 
			-- Plugin configs here
		})
	end
}
```

If the plugin configurations is too long, you can add a *plugin config file* to `lua/user/configs/`

>Then remove from `init.lua`

### Example
`init.lua`
```lua
plugins.config.plugins  = {
	-- ...
	"author/plugin_name"
}
```

`lua/user/configs/plugin_name.lua`
```lua
local plugin_name = require("plugin_name")

plugin_name.setup({
	-- ...
})
```

# Credits
Made by me

Inspired by: [Neovim from Scratch](https://github.com/LunarVim/Neovim-from-scratch/)

