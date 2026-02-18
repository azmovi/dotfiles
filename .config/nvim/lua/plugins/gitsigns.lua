return {
    'lewis6991/gitsigns.nvim',
    event = "BufRead",
    config = function()
        local map = require('core.keymaps').map
        local gitsigns = require('gitsigns')
        gitsigns.setup({
            on_attach = function(bufnr)
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
            end
        })
    end
}
