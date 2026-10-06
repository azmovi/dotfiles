return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- SQL não tem formatter aqui de propósito: usamos lsp_fallback, que chama
		-- o sqlmesh_lsp (= `sqlmesh format`, dialeto/opções vindos do transform/config.py).
		-- O gatilho de format-on-save é o autocmd BufWritePre global em core/autocmd.lua.
		formatters_by_ft = {
			markdown = { "prettierd" },
			sh = { "shfmt" },
			json = { "prettierd" },
			python = { "ruff" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			cucumber = { "reformat-gherkin" },
		},
		notify_on_error = true,
	},
}
