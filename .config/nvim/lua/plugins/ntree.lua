local function on_attach(bufnr)
    local api = require "nvim-tree.api"
    local map = require("helpers.keys").map

    api.config.mappings.default_on_attach(bufnr)
    map('n', '?', api.tree.toggle_help, 'Open help commands')
    map('n', '<C-cr>', api.node.open.vertical, 'Open in vertical split')
end

return {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local ntree = require("nvim-tree")
        local map = require("helpers.keys").map
        map('n', '<leader>fe', '<cmd>NvimTreeToggle<CR>', 'Open file browser')
        map('n', '<esc>', '<cmd>NvimTreeClose<CR>', 'Close file browser')
        ntree.setup({
            disable_netrw = true,
            on_attach = on_attach,
            view = {
                float = {
                    enable = true,
                    open_win_config =
                    {
                        relative = "editor",
                        border = "rounded",
                        width = 80,
                        height = 30,
                        row = 5,
                        col = 50,
                    }

                }
            }
        })
    end
}
