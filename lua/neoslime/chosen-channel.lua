local config = require('neoslime.config')
function set_chosen_channel(channel)
  if config.per_buffer_channel == true then
    vim.api.nvim_buf_set_var(0, 'chosen_channel', channel)
  elseif config.per_buffer_channel == false then
    config.chosen_channel = channel
  end
end

function get_chosen_channel()
  if config.per_buffer_channel == true then
    return(vim.b.chosen_channel)
  elseif config.per_buffer_channel == false then
    return(config.chosen_channel)
  end
end

function toggle_per_buffer()
  if config.per_buffer_channel == true then
     config.per_buffer_channel = false
  elseif config.per_buffer_channel == false then
     config.per_buffer_channel = true
  end
end
