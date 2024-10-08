return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {{'kkharji/sqlite.lua', module = 'sqlite'}},
    config = function()
        local neoclip = require('neoclip')
        local map = require('helpers.keys').map
        map('n', '<leader>fy', '<cmd>Telescope neoclip<cr>', 'Open Telescope Clipboard Manager')
        neoclip.setup({
              enable_persistent_history = true,
              db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        })
    end,
}
