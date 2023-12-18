function edit_channel_and_send(code)
  local all_channels = get_channels()
  if all_channels[1] == nil then
    error("No channels available, open a channel by typing :terminal")
    return
  end
  vim.ui.select(all_channels, {
      prompt = 'Select channel',
      format_item = function(channel)
        return channel .. ":\t" .. get_channel_name(channel)
      end,
  }, function(chosen_channel)
     vim.g.chosen_channel = chosen_channel
     vim.api.nvim_chan_send(vim.g.chosen_channel, code) -- send code to chosen channel
  end)
end

-- send content to channel, if no channel, edit channel
function send_content(code)
  if vim.g.chosen_channel == nil then
    edit_channel_and_send(code)
  else
    local channel_is_valid = check_if_channel_is_valid()
    if channel_is_valid == true then -- send to chosen channel
      vim.api.nvim_chan_send(vim.g.chosen_channel, code) -- send code to chosen channel
    else -- if channel is not valid, select new channel and send
      edit_channel_and_send(code)
    end
  end
end

-- send code from current paragraph
function send_line()
  local line = vim.api.nvim_get_current_line() .. "\r"
  vim.cmd('norm! j')
  send_content(line)
end

-- Send visual selection
function send_visual_selection()
  local content = get_visual_selection()
  send_content(code)
end
