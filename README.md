# Slime for neovim


This plugin is based on the amazing [vim-slime](https://github.com/jpalardy/vim-slime)
plugin, but written in lua and only meant for use with the neovim terminal.

Some key features of neoslime is:

- Written in lua
- Only compatible with the neovim terminal
- Select terminal with `vim.ui.select()`
- Set single channel across multiple buffers


# Installation

- Only tested with [lazy.nvim plugin manager](https://github.com/folke/lazy.nvim)

```
{
  mackris/neoslime
}
```

# Usage

- `NeoSlimeEdit`
  + Edit channel
- `NeoSlimeSendLine`
  + Send current line to channel
- `NeoSlimeSendVisualSelection`
  + Send visual selection to channel

# Configuration and keybindings

```lua
require('neoslime').setup({
  chosen_channel     = nil, -- The chosen channel to send code to
  per_buffer_channel = false, -- true if you want to set a channel for each buffer
  use_default_neoslime_keybinds = true, -- true if you want to use the default keybinds
  cell_delim = "```", -- The default cell delimiter
  filter_channel = "quarto" -- Filter out channel based on lua pattern matching	(not regex)
})
``` 

## Default keybindings

The default keybindings are currently:

- `ctrl + h` send current line when in interactive mode
- `ctrl + h` send visual selection when in visual mode
- `leader + s` send cell content, current delimitors are ```
- `leader + e` edit channel
