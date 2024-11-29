local function set_colorscheme(colorscheme, bg_op)
	-- Good default colorschemes: torte, slate
	-- Set colorscheme if the method is not executed on "init.lua"
	if colorscheme == nil then -- No colorscheme provided
		colorscheme = "slate" -- Default colorscheme
	end

	-- Check if colorscheme exists
	local status_ok, _ = pcall(vim.cmd, ("colorscheme " .. colorscheme))
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end

	-- Set background opacity if set
	if bg_op then
		-- vim.cmd('highlight Normal guibg=none')
		-- vim.cmd('highlight Normal guibg=#222222' .. bg_op)
		vim.cmd('highlight Normal guibg=#000000' .. bg_op)
	end
end

return {
	set_colorscheme = set_colorscheme
};
