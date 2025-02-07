return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    enabled = false,
    config = function()
        local pairs = require('nvim-autopairs')
        pairs.setup({
            fast_wrap = {
                map = '<M-e>',
                chars = { '{', '[', '(', '"', "'" },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = '$',
                before_key = 'h',
                after_key = 'l',
                cursor_pos_before = true,
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                manual_position = true,
                highlight = 'Search',
                highlight_grey='Comment'
            },
        })
        vim.keymap.set("i", "<M-n>", "<esc>:exe 'norm! l%%'<CR>a", { silent = true })
    end
}
