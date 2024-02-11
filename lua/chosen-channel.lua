function set_chosen_channel(channel)
  if vim.g.per_buffer_channel == true then
    vim.api.nvim_buf_set_var(0, 'chosen_channel', channel)
  elseif vim.g.per_buffer_channel == false then
    vim.g.chosen_channel = channel
  end
end

function get_chosen_channel()
  if vim.g.per_buffer_channel == true then
    return(vim.b.chosen_channel)
  elseif vim.g.per_buffer_channel == false then
    return(vim.g.chosen_channel)
  end
end

