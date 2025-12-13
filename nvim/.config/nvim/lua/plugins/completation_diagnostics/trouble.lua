-- List for showing diagnostics
return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "[D]iagnostics (Trouble)",
		},
		{
			"<leader>xb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "[B]uffer Diagnostics (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "[S]ymbols (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "[L]SP references (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "[Q]uickfix List (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "[L]ocation List (Trouble)",
		},
	},
}
