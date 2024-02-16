local neoslime = {}
require('neoslime.send-stuff')
require('neoslime.edit-channel')
require('neoslime.get-visual-selection')
require('neoslime.get-channels')
require('neoslime.print-channel')
require('neoslime.chosen-channel')
local config = require('neoslime.config')

function neoslime.setup(values) 
  setmetatable(
    config,
    { __index = vim.tbl_extend('force', config.defaults, values)}
  ) 
end

return neoslime
