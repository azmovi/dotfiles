local map = require('helpers.keys').map

-- Basics
map('i', 'jk', '<ESC>', 'Normal mode')
map('n', '<leader>x', '<cmd>nohl<cr>', 'Clear highlights')
map('n', '<leader>y', '<cmd>%y+<cr>', 'Clipboard all')
map('v', '<leader>y', '"+y', 'Clipboard visual session')

-- Stay in visual mode
map('v', '<', '<gv', 'Indent code to right')
map('v', '>', '>gv', 'Indent code to left')
map('v', 'J', ":m '>+1<CR>gv=gv", 'Moving block code to down')
map('v', 'K', ":m '<-2<CR>gv=gv", 'Moving block code to up')

-- Window moving
map('n', '<C-h>', '<C-w>h', 'Move to left window')
map('n', '<C-l>', '<C-w>l', 'Move to right window')
map('n', '<C-k>', '<C-w>k', 'Move to up window')
map('n', '<C-j>', '<C-w>j', 'Move to down window')

map('n', '<S-l>', '<cmd>vertical resize -2<cr>', 'Decrease size window')
map('n', '<S-h>', '<cmd>vertical resize +2<cr>', 'Increase size window')

map('n', '<leader>v', '<cmd>vsplit<cr><cmd>b#<cr>', 'Open first buffer in vertical')

-- Buffer Manager
function DeleteAllBuffersExceptCurrent()
    local current_buf = vim.api.nvim_get_current_buf()

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            if vim.bo[buf].modified then
                vim.api.nvim_set_current_buf(buf)
            else
                vim.api.nvim_buf_delete(buf, { force = false })
            end
        end
    end
end

map('n', '<leader>q', '<cmd>bd<cr>', 'Delete my buffer')
map('n', '<leader><C-q>', ':lua DeleteAllBuffersExceptCurrent()<cr>', 'Delete rest of buffers')
map('n', '<leader><leader>', '<cmd>bnext<cr>', 'Next buffer')
map('n', '<leader>cp', '<cmd>let @+ = expand("%:p")<cr>', 'Copy my current buffer')

-- Spell Checker
function ToggleSpellCheck()
    if vim.wo.spell then
        vim.wo.spell = false
        print('Spell check disabled')
    else
        vim.wo.spell = true
        print('Spell check enabled')
    end
end

map('n', '<leader>d', ':lua ToggleSpellCheck()<cr>', 'Activate spell checker')
