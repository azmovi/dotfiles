local parsers = {
	"lua",
	"python",
	"javascript",
	"typescript",
	"bash",
	"markdown",
	"html",
	"toml",
	"json",
	"vim",
	"vimdoc",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = parsers,
			auto_install = true,
			highlight = { enable = true },
			indent = {
				enable = true,
				disable = { "python" },
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		opts = { max_lines = 3 },
	},
}
