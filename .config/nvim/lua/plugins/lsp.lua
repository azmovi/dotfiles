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

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function()
		local telescope = require("telescope.builtin")
		local map = require("utils").map

		map("n", "gd", vim.lsp.buf.definition, "go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "go to declaration")
		map("n", "<A-l>", vim.diagnostic.open_float, "move to diagnostic")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "open code actions")
		map("n", "<leader>r", vim.lsp.buf.rename, "replace name at all")
		map("n", "<leader>h", function()
			vim.lsp.buf.format({ async = true })
		end, "format code")
		map("n", "gr", telescope.lsp_references, "go to references")
		map("n", "<leader>rs", ":LspRestart<CR>", "restart LSP")
	end,
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
