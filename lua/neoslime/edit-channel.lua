-- Edit channel receiving content
local config = require('neoslime.config')

function edit_channel()
  local all_channels = get_channels()
  vim.ui.select(all_channels, {
      prompt = 'Select channel',
      format_item = function(channel)
        return channel .. ":\t" .. get_channel_name(channel)
      end,
  }, function(chosen_channel)
    if chosen_channel ~= nil then
     config.chosen_channel = chosen_channel
    end
  end)
end

