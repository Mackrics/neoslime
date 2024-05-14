-- source scripts to be loaded
require('neoslime')
local config = require('neoslime.config')

vim.api.nvim_create_user_command(
  'NeoSlimeEdit', 
  'lua edit_channel()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeEdit', 
  'lua edit_channel()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeSendLine', 
  'lua send_line()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeSendCell', 
  'lua send_cell_content()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeSendVisualSelection', 
  'lua send_visual_selection()',
  {range = true}
)

vim.api.nvim_create_user_command(
  'NeoSlimePrint', 
  'lua print_channel()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeToggle', 
  'lua toggle_per_buffer()',
  {}
)


-- Default keybindings
if config.use_default_neoslime_keybinds == true then
  keymap = "?^" .. config.cell_delim .. "<Cr>jV/^" .. config.cell_delim .. "<Cr>k:'<,'> NeoSlimeSendVisualSelection<Cr>n"
  vim.keymap.set("n", "<leader>s",  keymap)
  vim.keymap.set({"n", "i"}, "<C-h>", "<Cmd>NeoSlimeSendLine<Cr>")
  vim.keymap.set("v", "<C-h>",  ":'<,'> NeoSlimeSendVisualSelection<Cr>")
  vim.keymap.set({"n", "v"}, "<leader>e", "<Cmd>NeoSlimeEdit<Cr>")
end
