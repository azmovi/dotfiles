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
