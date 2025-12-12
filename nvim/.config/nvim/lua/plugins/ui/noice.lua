-- lazy.nvim
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {

		messages = {
			enabled = false,
		},

		views = {
			cmdline_popup = {
				position = {
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},

			popupmenu = {
				relative = "editor",
				position = {
					row = 25,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},

		presets = {
			bottom_search = true,
			long_message_to_split = true,
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
