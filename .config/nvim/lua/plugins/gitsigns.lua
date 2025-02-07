return {
    'lewis6991/gitsigns.nvim',
    config = function()
        local gitsigns = require('gitsigns')
        local map = require('helpers.keys').map
        gitsigns.setup({
            on_attach = function(bufnr)
                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk)
                map('n', '<leader>hr', gitsigns.reset_hunk)
                map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                map('n', '<leader>hd', gitsigns.preview_hunk)
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
            end
        })
    end
}
