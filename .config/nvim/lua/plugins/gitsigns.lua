local xpto = "agora eu altero algo"

return {
    'lewis6991/gitsigns.nvim',
    config = function ()
        local gitsigns = require('gitsigns')
        gitsigns.setup{}
    end
}
