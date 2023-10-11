--:h lua-guide-commands-create
-- https://github.com/Shatur/neovim-session-manager/blob/68dde355a4304d83b40cf073f53915604bdd8e70/plugin/session_manager.lua

local slime = require('send-stuff')

vim.api.nvim_create_user_command(
  'NeoSlimeSendLine', 
  'lua send_line()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeSendBlock', 
  'lua send_block()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeSendCell', 
  'lua send_cell()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeSendVisualSelection', 
  'lua send_visual_selection()',
  {range = 0}
)

vim.api.nvim_create_user_command(
  'NeoSlimeSendQuarto', 
  'lua send_quarto()',
  {}
)

vim.api.nvim_create_user_command(
  'NeoSlimeEdit', 
  'lua edit_channel()',
  {}
)
