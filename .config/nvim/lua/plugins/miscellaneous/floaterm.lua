return {
	"voldikss/vim-floaterm",

	vim.keymap.set("n", "<leader>nf", ":FloatermNew<cr>", { desc = "Open new Floaterm" }),
	vim.keymap.set("n", "<leader>kf", ":FloatermKill<cr>", { desc = "Kill Floaterm" }),
	vim.keymap.set("n", "<leader>hf", ":FloatermHide<cr>", { desc = "Hide Floaterm" }),
	vim.keymap.set("n", "<leader>tf", ":FloatermShow<cr>", { desc = "Toggle Floaterm" }),
}
