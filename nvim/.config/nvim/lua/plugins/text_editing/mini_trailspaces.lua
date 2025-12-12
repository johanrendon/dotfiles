return {
	"echasnovski/mini.trailspace",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local miniTrailspace = require("mini.trailspace")

		miniTrailspace.setup({
			only_in_normal_buffers = true,
			modes = {},
		})

		-- Tu tecla para borrar espacios
		vim.keymap.set("n", "<leader>cw", function()
			miniTrailspace.trim()
		end, { desc = "Erase Whitespace" })
	end,
}
