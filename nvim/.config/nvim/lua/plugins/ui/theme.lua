-- Themes
return {
	-- add dracula
	{
		"Mofiqul/dracula.nvim",
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	"folke/tokyonight.nvim",
	"ellisonleao/gruvbox.nvim",
	"navarasu/onedark.nvim",
	"rebelot/kanagawa.nvim",
}
