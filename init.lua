
-- Get all code content for R file
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

-- Comment out these when sourcing
vim.cmd("command GetFileContent lua get_file_content()")
vim.keymap.set("n", "<leader>gfc", "<Cmd>GetFileContent<Cr>")



-- this sends stuff to terminal!
function send_file_content()
  local code = get_file_content()
  --local text = "print('hello')\rprint('hi')\r" -- this should be print file stuff
  local channel = 88 -- this should ideally be a global variable applicable for all re-usage
  vim.api.nvim_chan_send(channel, code)
end
-- this works https://neovim.discourse.group/t/how-to-new-a-terminal-and-send-to-run-command-with-lua/4218
