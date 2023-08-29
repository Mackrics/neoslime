-- Get all code content from qmd file
function get_file_content()  -- arguments: julia, r, python ...
	local path = vim.api.nvim_buf_get_name(0) -- get path of current buffer
	local file = io.open(path, r) -- load current file
	local file_content = file:read("*a") -- get file content
	-- could we instead print this as list?
	-- gmatch output a function
	-- calling matches() will return the next string each time
	-- think of this as list of function
	local matches = string.gmatch(file_content, "```{r}(.-)```") -- make flexible in language
	-- placeholder values
	local i = 0
	local code_table = {}
	for match in matches do
		i = i + 1
		code_table[i] = match
	end
	code = table.concat(code_table, "\r")
	return code
end

-- Print available channels
function get_channels()
	-- the output here is https://neovim.io/doc/user/api.html#nvim_get_chan_info()
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


-- Pick channel
function send_content()
	local code = get_file_content()
	local all_channels = get_channels()
	-- if channel is null, return error
	-- if code is null, return error
	-- check if global variable chosen_channel already exist
     	vim.ui.select(all_channels, {
     	    prompt = 'Select channel',
     	    format_item = function(channel)
     	        return "Channel: " .. channel
     	    end,
     	}, function(chosen_channel)
     	   vim.api.nvim_chan_send(chosen_channel, code) -- send code to chosen channel
     	end)
end
