return {
    'potamides/pantran.nvim',
    event = "VeryLazy",
    config = function()
        local map = require('core.keymaps').map
        local pantran = require('pantran')
        map(
            'v',
            '<leader>t',
            pantran.motion_translate({ engine = 'google', target = 'pt' }),
            'Translate this block'
        )
        pantran.setup({})
    end
}
