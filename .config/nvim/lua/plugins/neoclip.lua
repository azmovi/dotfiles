return {
    "AckslD/nvim-neoclip.lua",
    dependencies = { {'kkharji/sqlite.lua', module = 'sqlite'} },
    keys = {
        { "<leader>fy", "<cmd>Telescope neoclip<cr>", desc = "Neoclip" },
    },
    config = function()
        local neoclip = require('neoclip')
        neoclip.setup({
              enable_persistent_history = true,
              db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        })
    end,
}
