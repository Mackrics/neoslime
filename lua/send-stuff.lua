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

-- Edit channel receving content
function edit_channel()
  local all_channels = get_channels()
  vim.ui.select(all_channels, {
      prompt = 'Select channel',
      format_item = function(channel)
          return "Channel: " .. channel
      end,
  }, function(chosen_channel)
     vim.g.chosen_channel = chosen_channel
  end)
end

function edit_channel_and_send(code)
  local all_channels = get_channels()
  vim.ui.select(all_channels, {
      prompt = 'Select channel',
      format_item = function(channel)
          return "Channel: " .. channel
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
    vim.api.nvim_chan_send(vim.g.chosen_channel, code) -- send code to chosen channel
  end
end

-- send code from current paragraph
function send_line()
  local line = vim.api.nvim_get_current_line() .. "\r"
  vim.cmd('norm! j')
  send_content(line)
end

-- Get visual selection
function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  local i = 0
  local code_table = {}
  for _, line in ipairs(lines) do -- add \r to each line
	  i = i + 1
	  code_table[i] = line .. "\r"
  end
  code = table.concat(code_table) -- convert to string
  return(code)
end

-- Send visual selection
function send_visual_selection()
  local content = get_visual_selection()
  send_content(code)
end
