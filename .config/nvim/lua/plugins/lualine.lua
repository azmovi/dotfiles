return {
    'nvim-lualine/lualine.nvim',
    event = "UIEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require('lualine')
        lualine.setup({
            options = {
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
            },
        })
    end
}
