local utils = require("utils")

local group = vim.api.nvim_create_augroup("_general-settings", {})

vim.api.nvim_create_autocmd("VimEnter", {
	group = group,
	desc = "Open Telescope on empty startup",
	callback = function()
		if vim.fn.argc() ~= 0 then
			return
		end
		utils.open_project_files()
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = "*",
	group = group,
	desc = "Restore last cursor position when reopening a file",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local row = mark[1]
		if (row > 1) and (row <= vim.api.nvim_buf_line_count(0)) then
			return vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	pattern = "*",
	group = group,
	desc = "Resize window always",
	command = "tabdo wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "htmldjango", "javascript", "css" },
	group = group,
	desc = "Change tab value",
	callback = function()
		vim.bo.expandtab = true
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
	end,
})

local quitting = false
vim.api.nvim_create_autocmd("CmdlineLeave", {
	pattern = "*",
	group = group,
	desc = "Check if you are quitting",
	callback = function()
		local cmd = vim.fn.getcmdline()
		if cmd:match("^w?q") then
			quitting = true
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = group,
	desc = "Format file on save",
	callback = function()
		vim.lsp.buf.format({ async = not quitting })
		quitting = false
	end,
})
