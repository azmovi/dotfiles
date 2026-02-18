return {
    'echasnovski/mini.indentscope',
    version = '*',
    event = "BufEnter",
    config = function()
        local indentscope = require('mini.indentscope')
        indentscope.setup()
    end
}
