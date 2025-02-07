return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        completion = {
            keyword = { range = 'full' },
            accept = { auto_brackets = { enabled = true }, },

            list = {
                selection = {
                    preselect = true,
                    auto_insert = true
                }
            },

            menu = {
                auto_show = true,
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" }
                    },
                }
            },
            documentation = { auto_show = false, auto_show_delay_ms = 500 },
            ghost_text = { enabled = false },
        },

        keymap = {
            preset = 'default',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Tab>'] = { 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            cmdline = {},
        },
        signature = { enabled = true }
    }
}
