return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- Document existing key chains
		spec = {
			{ "<leader>s", group = "[S]earch and [S]plits" },
			{ "<leader>sr", desc = "[S]earch & [R]eplace word" },
			{ "<leader>tb", group = "[T]ab" },
			{ "<leader>th", group = "[T]heme" },
			{ "<leader>c", group = "[C]ode related" },
			{ "<leader>x", group = "Trouble Diagnostics" },
			{ "<C-h>", desc = "Move to left split" },
			{ "<C-j>", desc = "Move to below split" },
			{ "<C-k>", desc = "Move to above split" },
			{ "<C-l>", desc = "Move to right split" },
		},
	},
}
