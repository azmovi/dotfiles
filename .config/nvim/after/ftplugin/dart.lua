vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

-- Mapping
local map = require("utils").map
map(
	"n",
	"<leader>p",
	":w | FlutterRun lib/main.dart --dart-define-from-file envs/common.json --dart-define-from-file envs/dev.json<CR>",
	"Execute flutter emulator"
)
