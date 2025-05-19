-- For do test
return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-python",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-python"),
				},
			})
			vim.keymap.set("n", "<leader>tc", function()
				require("neotest").run.run()
			end, { desc = "Init test" })
		end,
	},
}
