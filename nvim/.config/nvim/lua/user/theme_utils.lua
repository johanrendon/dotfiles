-- Theme persistence utilities

-- Function to save theme permanently
local function save_theme(theme_name)
	local config_file = vim.fn.stdpath("config") .. "/lua/current-theme.lua"
	local content = 'vim.cmd("colorscheme ' .. theme_name .. '")\n'
	local file = io.open(config_file, "w")
	if file then
		file:write(content)
		file:close()
		vim.notify("Theme saved: " .. theme_name, vim.log.levels.INFO)
	else
		vim.notify("Failed to save theme", vim.log.levels.ERROR)
	end
end

-- Function to apply theme and save it
local function apply_theme(theme_name)
	vim.cmd("colorscheme " .. theme_name)
	save_theme(theme_name)
end

-- Make the function globally available
_G.apply_theme = apply_theme

return {
	apply_theme = apply_theme,
	save_theme = save_theme,
}