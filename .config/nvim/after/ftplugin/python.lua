vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = "/usr/bin/python"

local map = require("core.keymaps").map
map("n", "<leader>p", ":w | !python3 %<CR>", "Execute python code")
