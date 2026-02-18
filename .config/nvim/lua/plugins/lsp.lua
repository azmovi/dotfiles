local severity = vim.diagnostic.severity

vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = " ",
			[severity.INFO] = " ",
		},
	},
})

return {
	"mason-org/mason-lspconfig.nvim",
	event = "BufReadPre",
	opts = {
		ensure_installed = {
			"lua_ls",
			"pyright",
			"ruff",
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"eslint",
			"typos_lsp",
			"sqls",
		},
	},
	dependencies = {
		"stevearc/conform.nvim",
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
}
