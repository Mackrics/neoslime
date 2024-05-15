local config = require('neoslime.config')

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
     set_chosen_channel(chosen_channel)
     vim.api.nvim_chan_send(get_chosen_channel(), code) -- send code to chosen channel
  end)
end

-- send content to channel, if no channel, edit channel
function send_content(code)
  if get_chosen_channel() == nil then
    edit_channel_and_send(code)
  else
    local channel_is_valid = check_if_channel_is_valid()
    if channel_is_valid == true then -- send to chosen channel
      vim.api.nvim_chan_send(get_chosen_channel(), code) -- send code to chosen channel
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

-- get current line number
function get_row_num() 
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  return(r)
end

function get_bound(delim, find_upper) 
  if find_upper then
    const = 1
  else 
    const = - 1
  end
  bound = false
  row = get_row_num()
  temp = row
  while (temp > 0 and not bound) do -- get upper bound
    if find_upper then
      text = unpack(vim.api.nvim_buf_get_lines(0, temp - const, temp, true))
    else
      text = unpack(vim.api.nvim_buf_get_lines(0, temp, temp - const, true))
    end
    bound = string.find(text, delim) == 1
    temp = temp - const
  end
    if find_upper then
      return(temp + const)
    else
      return(temp + const)
    end
end

function get_cell_content(delim)
  -- get current line
  -- check if line above is empty 
  upper = get_bound(delim, true)
  lower = get_bound(delim, false)
  content_tab = vim.api.nvim_buf_get_lines(0, upper, lower, true)
  return(content_tab)
end

function send_cell_content()
  content_tab = get_cell_content(config.cell_delim)
  for _, row in ipairs(content_tab) do
    send_content(row.."\n")
  end
end

-- Send visual selection
function send_visual_selection()
  local content = get_visual_selection()
  send_content(code)
end
