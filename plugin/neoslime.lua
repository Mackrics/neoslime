-- source scripts to be loaded
require('send-stuff')
require('edit-channel')
require('get-visual-selection')
require('get-channels')
require('chosen-channel')

-- Default channel is nil
vim.g.chosen_channel = nil
vim.g.per_buffer_channel = false

-- use default keybindings by default
if vim.g.use_default_neoslime_keybinds == nil then
  vim.g.use_default_neoslime_keybinds = true
end

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
if vim.g.use_default_neoslime_keybinds == true then
  vim.keymap.set("n", "<leader>s",  "?^```<Cr>jV/^```<Cr>k:'<,'> NeoSlimeSendVisualSelection<Cr>n")
  vim.keymap.set({"n", "i"}, "<C-h>", "<Cmd>NeoSlimeSendLine<Cr>")
  vim.keymap.set("v", "<C-h>",  ":'<,'> NeoSlimeSendVisualSelection<Cr>")
  vim.keymap.set({"n", "v"}, "<leader>e", "<Cmd>NeoSlimeEdit<Cr>")
end
