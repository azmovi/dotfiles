return {
    'potamides/pantran.nvim',
    config = function ()
        local map = require('helpers.keys').map
        local pantran = require('pantran')
        map('v', '<leader>t', pantran.motion_translate({engine='google', target='pt'}), 'Translate this block')
        pantran.setup{}
    end
}

