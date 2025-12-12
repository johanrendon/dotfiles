-- Show the colors in the terminal
return {
	"norcalli/nvim-colorizer.lua",

	config = function()
		require("colorizer").setup()
	end,
}
