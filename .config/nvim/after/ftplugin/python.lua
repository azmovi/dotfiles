vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = "/usr/bin/python"
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.textwidth = 80
vim.g.pyindent_open_paren = vim.bo.shiftwidth

local map = require("utils").map
map("n", "<leader>p", ":w | !python3 %<CR>", "Execute python code")
