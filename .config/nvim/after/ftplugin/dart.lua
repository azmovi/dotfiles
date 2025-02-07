vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

-- Mapping
local map = require('helpers.keys').map
map('n', '<leader>p', ':w | !FlutterRun<CR>', 'Execute flutter emulator')
