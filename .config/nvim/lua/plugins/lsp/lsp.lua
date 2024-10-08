local lsps = { 'lua_ls', 'pyright', 'cssls'}
local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' ',
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    signs = true,
    severity_sort = true,
    inlay_hints = {
        enabled = true,
    },
})

return {
    {
        "williamboman/mason.nvim",
        config = function()
            local mason = require('mason')
            mason.setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim",
        config = function()
            local lsp_mason = require("mason-lspconfig")
            lsp_mason.setup({
                ensure_installed = lsps,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        after = "mason-lspconfig.nvim",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local map = require('helpers.keys').map
            local on_attach = function()
                map('n', 'gd', vim.lsp.buf.definition, 'go to definition')
                map('n', 'gD', vim.lsp.buf.declaration, 'go to declaration')
                map("n", 'gs', vim.lsp.buf.hover, 'go to signature')
                map("n", 'gi', vim.lsp.buf.implementation, 'go to implementation')
                map("n", 'gr', vim.lsp.buf.references, 'go to references')
                map("n", '<leader>h', function() vim.lsp.buf.format { async = true } end, 'format code')
                map("n", '<leader>H', vim.lsp.buf.code_action, 'open code actions')
                map("n", '<leader>r', vim.lsp.buf.rename, 'replace name at all')
                map("n", '<A-l>', vim.diagnostic.open_float, 'move to diagnostic')
                map("n", '<leader>l', vim.diagnostic.goto_next, 'move to diagnostic')
                map("n", '<leader>L', vim.diagnostic.goto_prev, 'back to diagnostic')
            end

            local settings = require('plugins.lsp.settings')

            for _, lsp in ipairs(lsps) do
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = settings[lsp],
                })
            end
        end,
    },
}
