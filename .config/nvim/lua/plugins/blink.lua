return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = "rafamadriz/friendly-snippets",
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		completion = {
			keyword = { range = "prefix" },
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},

			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},

			menu = {
				auto_show = false,
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			ghost_text = { enabled = true },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		keymap = { preset = "default" },
		signature = { enabled = true },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				sql = { "dadbod" },
			},
			providers = {
				dadbod = { module = "vim_dadbod_completion.blink" },
				lazydev = { module = "lazydev.integrations.blink" },
			},
		},
	},
	opts_extend = { "sources.default" },
}
