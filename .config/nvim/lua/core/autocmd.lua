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
	pattern = { "html", "htmldjango", "javascript", "css", "markdown" },
	group = group,
	desc = "Change tab value",
	callback = function()
		vim.bo.expandtab = true
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
	end,
})

-- Síncrono de propósito: formata ANTES de escrever, num único :w.
-- Com async=true o 1º :w grava sem formatar e o format re-suja o buffer,
-- exigindo um 2º :w.
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = group,
	desc = "Format file on save",
	callback = function()
		require("conform").format({ async = false, lsp_fallback = true })
	end,
})
