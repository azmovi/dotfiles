local parsers = {
	"lua",
	"python",
	"javascript",
	"typescript",
	"tsx",
	"bash",
	"html",
	"toml",
	"vim",
	"vimdoc",
	"json",
	"markdown",
	"yaml",
}

local ts_filetypes = {
	"lua",
	"python",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"js",
	"jsx",
	"ts",
	"tsx",
	"sh",
	"bash",
	"zsh",
	"html",
	"toml",
	"vim",
	"help",
	"yaml",
	"json",
	"markdown",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()

			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = ts_filetypes,
				callback = function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		opts = { max_lines = 3 },
	},
}
