vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = '/usr/bin/python'

-- Mapping
local map = require('helpers.keys').map
map('n', '<leader>p', ':w | !python3 %<CR>', 'Execute python code')
