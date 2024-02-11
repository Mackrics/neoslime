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

# Configuration and keybindings

Neoslime currently has one configuration option: activating and de-activating
default keybindings.

```lua
-- use the default keybindings
vim.g.use_default_neoslime_keybinds = true
``` 

## Default keybindings

The default keybindings are currently:

- `ctrl + h` send current line when in interactive mode
- `ctrl + h` send visual selection when in visual mode
- `leader + s` send cell content, current delimitors are ```
- `leader + e` edit channel
