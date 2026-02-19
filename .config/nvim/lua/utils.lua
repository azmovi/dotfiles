local M = {}

function M.open_project_files()
	require("telescope.builtin").find_files({
		hidden = true,
		file_ignore_patterns = { "^.git/" },
	})
end

function M.map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

return M
