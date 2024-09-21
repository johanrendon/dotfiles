return {
	"ggandor/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		vim.keymap.set("n", "<C-s>", "<Plug>(leap)")
	end,
}
