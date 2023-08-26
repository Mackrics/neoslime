
-- Get all code content for R file
function print_file() 
	local path = vim.api.nvim_buf_get_name(0) -- get path of current buffer
	local file = io.open(path, r) -- load current file
	local file_content = file:read("*a") -- get file content
	-- could we instead print this as list?
	local matches = string.gmatch(file_content, "```{r}(.-)```") -- make flexible
	for row in matches do
		print(row)
	end
end

-- Comment out these when sourcing
--vim.cmd("command PrintFile lua print_file()")
--vim.keymap.set("n", "<leader>fp", "<Cmd>PrintFile<Cr>")



-- this sends stuff to terminal!
function hi2()
  local text = "print('hello')\rprint('hi')\r" -- this should be print file stuff
  local channel = 88 -- this should ideally be a global variable applicable for all re-usage
  vim.api.nvim_chan_send(channel, text)
end
-- this works https://neovim.discourse.group/t/how-to-new-a-terminal-and-send-to-run-command-with-lua/4218
