# Slime for neovim


This plugin is based on the amazing [vim-slime](https://github.com/jpalardy/vim-slime)
plugin, but written in lua and only meant for use with the neovim terminal.

Some key features of neoslime is:

- Written in lua
- Only compatible with the neovim terminal
- Select terminal with `vim.ui.select()`
- Set single channel across multiple buffers


# Installation

- Only tested with [lazy.nvim plugin manager](https://www.lazyvim.org)


# Usage

- `NeoSlimeEdit`
  + Edit channel
- `NeoSlimeSendLine`
  + Send current line to channel
- `NeoSlimeSendVisualSelection`
  + Send visual selection to channel

# Keybindings

Add this to `init.lua`

```lua
-- Send line with ctrl + enter when in normal or insert mode (Rstudio style)
vim.keymap.set({"n", "i"}, "<C-cr>", "<Cmd>NeoSlimeSendLine<Cr>")
-- Send visual selection with ctrl + enter when in visual mode (Rstudio style)
vim.keymap.set("v", "<C-cr>",  ":'<,'> NeoSlimeSendVisualSelection<Cr>")
``` 

