return {
    'nvim-treesitter/nvim-treesitter-context',
    build = ':TSUpdate',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
    config = function ()
        local map = require("helpers.keys").map
        local context = require('treesitter-context')
        local treesitter = require('nvim-treesitter.configs')
        treesitter.setup{
            ensure_installed = {
                'python',
                'lua',
                'bash',
                'markdown',
                'yaml',
                'dockerfile',
                'html',
                'javascript',
                'toml'
            },
            sync_install = false,
            auto_install = true,
            ignore_install = { "" },
            highlight = {
                enable = true,
                disable = { "" },
                additional_vim_regex_highlighting = true,
            },
            indent = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            }
        }
        context.setup{
            enable = true,
            max_lines = 0,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = 'outer',
            mode = 'cursor',
            separator = nil,
            zindex = 20,
            on_attach = nil,
        }
        map('n', '<leader>j', function() context.go_to_context(vim.v.count1) end, 'Jump to context')
    end
}
