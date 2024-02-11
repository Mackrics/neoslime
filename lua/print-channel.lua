function print_channel()
  if vim.g.chosen_channel == nil then
    print("No channel chosen")
    return(nil)
  end
  local channel_name = vim.g.chosen_channel .. ": " .. get_channel_name(vim.g.chosen_channel)
  print(channel_name)
  return(nil)
end
