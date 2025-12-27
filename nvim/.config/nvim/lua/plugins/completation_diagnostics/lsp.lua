return {
	-- Configuración principal de LSP
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Mason: Gestor de paquetes para instalar LSPs, Formatters y Debuggers
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Blink.cmp: El motor de autocompletado (reemplazo moderno de nvim-cmp)
		"saghen/blink.cmp",

		-- Fidget: Notificaciones visuales de carga del LSP (abajo a la derecha)
		{ "j-hui/fidget.nvim", opts = {} },
	},

	config = function()
		-- Configuración de diagnósticos
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
		})

		-- Integración de capacidades con blink.cmp (para mejor autocompletado)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		-- Este autocomando se ejecuta cada vez que un LSP se conecta a un buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				-- Función auxiliar para simplificar la creación de atajos de teclado
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- -- KEYMAPS (Atajos) --
				-- Ir a la definición (donde se creó la variable/función)
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				-- Buscar referencias (dónde se usa esta variable en el proyecto)
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				-- Ir a la implementación (útil en interfaces/traits)
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				-- Ver la definición del TIPO de la variable
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

				-- Buscar símbolos en el archivo actual (variables, funciones)
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

				-- Buscar símbolos en todo el proyecto
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- Renombrar variable en todo el proyecto
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Acciones de código (sugerencias rápidas, correcciones)
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				-- Ir a la declaración (archivos de cabecera en C/C++, etc.)
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- Alternar "Inlay Hints" (pistas visuales de tipos dentro del código)
				map("<leader>ih", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
				end, "Toggle inlay hints")

				-- -- RESALTADO DE REFERENCIAS --
				-- Resalta palabras iguales bajo el cursor tras esperar un momento
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})

		-- -- SERVIDORES LSP --
		local servers = {
			-- Python: Usamos Pyright para tipos y Ruff para linting/formato
			ruff = {},
			-- basedpyright = {},
			-- pyrefly = {},
			ty = {},

			-- Rust
			-- rust_analyzer = {},

			-- Lua
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- Ignorar el error ruidoso de 'missing-fields'
						diagnostics = {
							disable = { "missing-fields" },
						},
					},
				},
			},

			-- Arduino
			arduino_language_server = {},

			-- Otros
			zls = {}, -- Zig
			bashls = {},
			fish_lsp = {},
			marksman = {},
			clangd = {},
		}

		require("mason").setup()

		-- Herramientas adicionales para instalar automáticamente
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			--Formaters
			"stylua", -- Formateador de Lua
			"prettypst",

			--Linters
			"markdownlint", -- Linter de Markdown

			-- Debuggers
			"codelldb",
			"debugpy", -- Debugger de Python
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}

					-- NOTE: Cuando se instale rust analyzer
					-- CORRECCIÓN RUST:
					-- Solo descomenta el 'return' si instalas el plugin 'rustaceanvim' aparte.
					-- De lo contrario, dejar esto activo rompería Rust.
					if server_name == "rust_analyzer" then
						return
					end

					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
