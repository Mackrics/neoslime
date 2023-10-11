--:h lua-guide-commands-create
-- https://github.com/Shatur/neovim-session-manager/blob/68dde355a4304d83b40cf073f53915604bdd8e70/plugin/session_manager.lua

local slime require("send-stuff")

vim.api.nvim_create_user_command(
  'SlimeEdit', 
  'lua slime.edit_channel()',
  {}
)

vim.api.nvim_create_user_command(
  'SlimeTest', 
  'lua print "hello!"',
  {}
)

