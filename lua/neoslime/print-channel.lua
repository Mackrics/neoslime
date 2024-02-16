local config = require('neoslime.config')
function print_channel()
  local channel = config.chosen_channel
  if channel == nil then
    print("No channel chosen")
    return(nil)
  end
  local channel_name = channel  .. ": " .. get_channel_name(channel)
  print(channel_name)
  return(nil)
end
