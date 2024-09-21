local map = require('helpers.keys').map

-- Roda codigo
map('n', '<leader>p', ':w | !python3 %<CR>', 'Execute python code')

-- Basics
map('i', 'jk', '<ESC>', 'Normal mode')
map('n', '<leader>y', "gg0vG$'+y", 'Clipboard all')
map('v', '<leader>y', "'+y", 'Clipboard visual session')
map('n', '<leader>x', '<cmd>nohl<cr>', 'Clear highlights')

-- Stay in visual mode
map('v', '<', '<gv', 'Indent code to right')
map('v', '>', '>gv', 'Indent code to left')
map('v', 'J', ":m '>+1<CR>gv=gv", 'Moving block code to down')
map('v', 'K', ":m '<-2<CR>gv=gv", 'Moving block code to up')

-- Movimentação de janelas
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
