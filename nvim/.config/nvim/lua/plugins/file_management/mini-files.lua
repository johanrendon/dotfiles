return {
	-- 1. Plugin principal (Mini.nvim como toolkit)
	{ "echasnovski/mini.nvim", version = false },

	-- 2. Módulo Mini.files
	{
		"echasnovski/mini.files",
		config = function()
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
				mappings = {
					-- La tecla 'L' ya está mapeada por defecto,
					-- pero esta configuración es funcional.
					go_in = "<CR>",
					go_in_plus = "L",
					go_out = "-",
					go_out_plus = "H",
				},
			})

			-- Tecla para alternar el explorador (abrir/cerrar)
			vim.keymap.set("n", "<leader>-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })

			-- Tecla para abrir el explorador y revelar el archivo actual
			vim.keymap.set("n", "<leader>_", function()
				-- Muestra el explorador
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				-- Asegura que la ventana se desplace a la ubicación del archivo
				MiniFiles.reveal_cwd()
			end, { desc = "Toggle into currently opened file" })
		end,
	},
}
