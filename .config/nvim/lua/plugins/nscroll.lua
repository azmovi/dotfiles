return {
    "karb94/neoscroll.nvim",
    config = function ()
        local map = require('helpers.keys').map
        local nscroll = require('neoscroll')
        map({'n', 'v', 'x'}, '<C-u>', function() nscroll.ctrl_u({ duration = 200; easing = 'circular' }) end, 'Scroll up')
        map({'n', 'v', 'x'}, '<C-d>', function() nscroll.ctrl_d({ duration = 200; easing = 'circular' }) end, 'Scroll up')
        nscroll.setup = {}
    end
}
