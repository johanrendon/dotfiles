return {
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true,
			})
			vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "Navigate to tmux pane left" })
			vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "Navigate to tmux pane down" })
			vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "Navigate to tmux pane up" })
			vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Navigate to tmux pane right" })
			vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>", { desc = "Navigate to next tmux pane" })
		end,
	},
}
