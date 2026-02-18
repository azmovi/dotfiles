local group = vim.api.nvim_create_augroup("_general-settings", {})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() ~= 0 then
			return
		end
		vim.defer_fn(function()
			require("telescope.builtin").find_files({
				hidden = true,
				file_ignore_patterns = { "^.git/" },
			})
		end, 50)
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = "*",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local row = mark[1]
		if (row > 1) and (row <= vim.api.nvim_buf_line_count(0)) then
			return vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
	group = group,
})

vim.api.nvim_create_autocmd(
	{ "VimResized" },
	{ pattern = "*", command = "tabdo wincmd =", group = vim.api.nvim_create_augroup("_auto_resize", {}) }
)

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "htmldjango", "javascript", "css" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function()
		local telescope = require("telescope.builtin")
		local mapper = require("core.keymaps").map

		mapper("n", "gd", vim.lsp.buf.definition, "go to definition")
		mapper("n", "gD", vim.lsp.buf.declaration, "go to declaration")
		mapper("n", "<A-l>", vim.diagnostic.open_float, "move to diagnostic")
		mapper("n", "<leader>ca", vim.lsp.buf.code_action, "open code actions")
		mapper("n", "<leader>r", vim.lsp.buf.rename, "replace name at all")
		mapper("n", "<leader>h", function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, "format code")
		mapper("n", "gr", telescope.lsp_references, "go to references")
		mapper("n", "<leader>rs", ":LspRestart<CR>", "restart LSP")
	end,
})
