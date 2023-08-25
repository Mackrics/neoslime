
-- Get all code content for R file
function print_file() 
	local path = vim.api.nvim_buf_get_name(0) -- get path of current buffer
	local file = io.open(path, r) -- load current file
	local file_content = file:read("*a") -- get file content
	--print(file_content) -- print file content
	--print(file_content:match("Work(.*)mory")) -- grep everything between work an mory
	--print(file_content:gmatch("```{r}(.-)```")) --- grep everything within quarto cell
	for i in string.gmatch(file_content, "```{r}(.-)```") do
   		print(i)
	end
end


--[[

	Maybe of interest: 
    :h function-list
    :h setbufline() -- what you probably need
    :h getbufline() -- and also this.
    :h appendbufline() -- and this.
--]]

-- This function paste hello att current positon - inspo!
-- https://www.reddit.com/r/neovim/comments/psux8f/how_to_use_a_lua_function_to_insert_text/?rdt=40230
function hello()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. 'hello' .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

--  slightly rewritten experiment...
function hi()
--local line = vim.api.nvim_get_current_line()
  local line = vim.api.nvim_buf_line_count(0) 
  print(line)
  local nline = line:sub(0, 1) .. 'hello' .. line:sub(1)
  vim.api.nvim_set_current_line(nline)
end
