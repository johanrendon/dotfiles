-- Highlight functionality
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({
				-- enable syntax highlighting
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				-- enable indentation
				indent = { enable = true },

				-- ensure these languages parsers are installed
				ensure_installed = {
					"json",
					"javascript",
					"go",
					"yaml",
					"html",
					"css",
					"python",
					"http",
					"markdown",
					"markdown_inline",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
					"c",
					"java",
					"rust",
					"ron",
					"typst",
					"zig",
					"toml",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<M-space>",
						node_incremental = "<M-space>",
						scope_incremental = false,
						node_decremental = "<M-bs>",
					},
				},
			})
		end,
	},
}