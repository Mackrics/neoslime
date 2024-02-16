-- Default channel is nil
local config = {}

config.defaults = {
  chosen_channel     = nil,
  per_buffer_channel = false,
  use_default_neoslime_keybinds = true
}

setmetatable(config, { __index = config.defaults })

return config
