return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function ()
        local flutter = require('flutter-tools')
        flutter.setup{}
    end

}
