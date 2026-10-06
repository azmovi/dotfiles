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
		local inlay_hints_enabled = false
		map("n", "<leader>t", function()
			inlay_hints_enabled = not inlay_hints_enabled
			vim.lsp.inlay_hint.enable(inlay_hints_enabled)
		end, "toggle inlay hints")
		map("n", "gd", telescope.lsp_definitions, "go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "go to declaration")
		map("n", "<A-l>", vim.diagnostic.open_float, "move to diagnostic")
		map("n", "ca", vim.lsp.buf.code_action, "open code actions")
		map("n", "<leader>r", vim.lsp.buf.rename, "replace name at all")
		map("n", "gr", telescope.lsp_references, "go to references")
		map("n", "<leader>lr", "<Cmd>lsp restart<CR>", "restart LSP")
	end,
})

return {
	"mason-org/mason-lspconfig.nvim",
	event = "BufReadPre",
	opts = {
		automatic_enable = { exclude = { "sqls" } },
		ensure_installed = {
			"lua_ls",
			-- "pyright",
			"ruff",
			"zuban",
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"eslint",
			"typos_lsp",
			"emmet_ls",
			"tombi",
			"marksman",
			"cucumber_language_server",
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
