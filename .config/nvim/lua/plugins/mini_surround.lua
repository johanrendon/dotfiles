return {
	{ -- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sa in visual mode
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup()
		end,
	},
}
