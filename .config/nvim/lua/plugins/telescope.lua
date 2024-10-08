return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
        },
    },
    config = function()
        local map = require("helpers.keys").map
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        map('n', '<leader>ff', builtin.find_files, 'Telescope find files')
        map('n', '<leader>fg', builtin.live_grep, 'Telescope live grep')
        map('n', '<leader>fb', builtin.buffers, 'Telescope buffers')
        map('n', '<leader>fl', builtin.diagnostics, 'Telescope diagnostics')
        map('n', '<leader>fs', builtin.git_status, 'Telescope git status')
        map('n', '<leader>w', builtin.spell_suggest, 'Telescope spell sugest')

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ['<C-CR>'] = 'select_vertical',
                    },
                    i = {
                        ['<C-CR>'] = 'select_vertical',
                    },
                }
            },
            pickers = {},
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })
        telescope.load_extension('fzf')
    end
}
