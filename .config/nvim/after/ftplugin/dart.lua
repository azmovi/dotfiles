vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

-- Mapping
local map = require('helpers.keys').map
map('n', '<leader>p', ':w | FlutterRun lib/main.dart --dart-define-from-file envs/common.json --dart-define-from-file envs/dev.json<CR>', 'Execute flutter emulator')

map('n', 'gd', vim.lsp.buf.definition, 'go to definition')
map('n', 'gD', vim.lsp.buf.declaration, 'go to declaration')
map("n", 'gs', vim.lsp.buf.hover, 'go to signature')
map("n", 'gi', vim.lsp.buf.implementation, 'go to implementation')
map("n", 'gr', vim.lsp.buf.references, 'go to references')
map("n", '<leader>h', function() vim.lsp.buf.format { async = true } end, 'format code')
map("n", '<leader>H', vim.lsp.buf.code_action, 'open code actions')
map("n", '<leader>r', vim.lsp.buf.rename, 'replace name at all')
map("n", '<A-l>', vim.diagnostic.open_float, 'move to diagnostic')
map("n", '<leader>l', vim.diagnostic.goto_next, 'move to diagnostic')
map("n", '<leader>L', vim.diagnostic.goto_prev, 'back to diagnostic')
