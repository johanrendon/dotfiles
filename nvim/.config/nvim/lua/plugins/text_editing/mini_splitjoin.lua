return {
	{
		"echasnovski/mini.splitjoin",
		version = false,
		config = function()
			local miniSplitJoin = require("mini.splitjoin")
			miniSplitJoin.setup({ mappings = { toggle = "" } })
			vim.keymap.set({ "n", "x" }, "sj", function()
				miniSplitJoin.join()
			end, { desc = "Join arguments" })
			vim.keymap.set({ "n", "x" }, "sk", function()
				miniSplitJoin.split()
			end, { desc = "Split arguments" })
		end,
	},
}
