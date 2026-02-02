-- Class Open Plugin
-- Opens C++ class files (.cpp/.c and .h/.hpp) in a vertical split layout
-- Works with bufferline.nvim plugin (uses buffers, shown in bufferline)
--
-- Commands:
--   :ClassOpen - Opens a picker to select a class from .h/.hpp files in current directory
--
-- Keymaps:
--   <leader>co - [C]lass [O]pen - Open class picker
--   <leader>ch - [C]lass [H]eader - Toggle between header and implementation

-- Check if file exists in any visible window
local function file_in_window(name)
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local bname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
		if vim.fn.fnamemodify(bname, ":t") == name then
			return win
		end
	end
	return nil
end

-- Switch to or open the class files
local switch_to_class = function(selected)
	if selected then
		-- Determine the header file extension based on what exists
		local h = selected .. ".h"
		local hpp = selected .. ".hpp"
		local header_file = nil

		if vim.fn.filereadable(h) == 1 then
			header_file = h
		elseif vim.fn.filereadable(hpp) == 1 then
			header_file = hpp
		else
			header_file = h -- default to .h
		end

		-- Determine the implementation file extension based on what exists
		local cpp = selected .. ".cpp"
		local c = selected .. ".c"
		local impl_file = nil

		if vim.fn.filereadable(cpp) == 1 then
			impl_file = cpp
		elseif vim.fn.filereadable(c) == 1 then
			impl_file = c
		else
			impl_file = cpp -- default to .cpp
		end

		-- Check if files exist in windows already
		local impl_win = file_in_window(vim.fn.fnamemodify(impl_file, ":t"))
		local header_win = file_in_window(vim.fn.fnamemodify(header_file, ":t"))

		-- If both files are already open in windows, just focus the implementation file
		if impl_win and header_win then
			vim.api.nvim_set_current_win(impl_win)
			return
		end

		-- Close other windows and set up the layout
		-- Only keep the current window
		vim.cmd("only")

		-- Open the implementation file in the current window
		vim.cmd.edit(impl_file)

		-- Open the header file in a vertical split on the right
		vim.cmd.vsplit(header_file)

		-- Move focus to the left window (implementation file)
		vim.cmd.wincmd("h")
	end
end

-- Open class picker
local openClassPicker = function()
	-- Directory of the current file
	local dir = vim.fn.expand("%:p:h")
	if dir == "" then
		vim.notify("No file directory found", vim.log.levels.WARN)
		return
	end

	-- Get header files in that directory
	local h_files = vim.fn.glob(dir .. "/*.h", false, true)
	local hpp_files = vim.fn.glob(dir .. "/*.hpp", false, true)

	local files = {}
	vim.list_extend(files, h_files)
	vim.list_extend(files, hpp_files)

	if #files == 0 then
		vim.notify("No .h or .hpp files found in " .. dir, vim.log.levels.WARN)
		return
	end

	-- Strip extensions + paths
	local classes = {}
	for _, file in ipairs(files) do
		table.insert(classes, vim.fn.fnamemodify(file, ":t:r"))
	end

	vim.ui.select(classes, {
		prompt = "Select Class",
	}, function(selected)
		if not selected then
			return
		end
		switch_to_class(dir .. "/" .. selected)
	end)
end

-- Create user command
vim.api.nvim_create_user_command("ClassOpen", openClassPicker, {})

-- Keymap to open class picker
vim.keymap.set("n", "<leader>co", openClassPicker, { desc = "[C]lass [O]pen - Open class files" })

-- Keymap to switch between header and implementation
vim.keymap.set("n", "<leader>ch", function()
	local current_file = vim.fn.expand("%:t")
	local ext = vim.fn.fnamemodify(current_file, ":e")
	local base = vim.fn.fnamemodify(current_file, ":r")

	if ext == "cpp" or ext == "c" then
		-- Switch to header
		local header = base .. ".h"
		if vim.fn.filereadable(header) == 1 then
			vim.cmd.edit(header)
		else
			-- Try .hpp
			header = base .. ".hpp"
			if vim.fn.filereadable(header) == 1 then
				vim.cmd.edit(header)
			else
				vim.notify("Header file not found", vim.log.levels.WARN)
			end
		end
	elseif ext == "h" or ext == "hpp" then
		-- Switch to implementation
		local impl = base .. ".cpp"
		if vim.fn.filereadable(impl) == 1 then
			vim.cmd.edit(impl)
		else
			-- Try .c
			impl = base .. ".c"
			if vim.fn.filereadable(impl) == 1 then
				vim.cmd.edit(impl)
			else
				vim.notify("Implementation file not found", vim.log.levels.WARN)
			end
		end
	else
		vim.notify("Current file is not a C/C++ source or header file", vim.log.levels.WARN)
	end
end, { desc = "[C]lass [H]eader - Toggle between header and implementation" })

-- Return empty table since this is a standalone config, not a lazy.nvim plugin spec
return {}
