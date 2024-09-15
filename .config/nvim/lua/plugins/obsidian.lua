return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Brain",
				path = "~/Brain/",
			},
		},
		ui = { enable = false },
		templates = {
			folder = "05_Others/Templates",
		},
	},

	vim.keymap.set("n", "<leader>bn", ":ObsidianQuickSwitch<cr>", { desc = "New note or search notes" }),
	vim.keymap.set("n", "<leader>bt", ":ObsidianTemplate<cr>", { desc = "Use templates" }),
	vim.keymap.set("n", "<leader>bo", ":ObsidianSearch<cr>", { desc = "Search in notes" }),
	vim.keymap.set("n", "<leader>bf", ":ObsidianFollowLink<cr>", { desc = "Follow link" }),
}
