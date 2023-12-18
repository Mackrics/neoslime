-- Print available channels
function get_channels()
  local channels = vim.api.nvim_list_chans()
  local channel_table = {}
  i = 0
  for _, channel in ipairs(channels) do
    if channel["buffer"] ~= nil then
      i = i + 1
      channel_table[i] = channel["id"]
    end
  end
  return(channel_table)
end

function get_channel_name(channel)
  local channel_info = vim.api.nvim_get_chan_info(channel)
  local buffer_channel = channel_info["buffer"]
  local channel_name = vim.api.nvim_buf_get_name(buffer_channel)
  return(channel_name)
end

-- check if chosen channel is valid
function check_if_channel_is_valid()
  local valid_channels = get_channels()
  local chosen_channel = vim.g.chosen_channel
  i = 0
  is_valid = false
  for _ in ipairs(valid_channels) do
    i = i + 1
    local is_valid = valid_channels[i] == chosen_channel
    if is_valid == true then
      return(is_valid)
    end
  end
  return(false)
end
