local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = " ",
      [severity.INFO] = " ",
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function()
        local telescope = require("telescope.builtin")
        local mapper = require('core.keymaps').map

        mapper('n', 'gd', vim.lsp.buf.definition, 'go to definition')
        mapper('n', 'gD', vim.lsp.buf.declaration, 'go to declaration')
        mapper("n", '<A-l>', vim.diagnostic.open_float, 'move to diagnostic')
        mapper("n", '<leader>ca', vim.lsp.buf.code_action, 'open code actions')
        mapper("n", '<leader>r', vim.lsp.buf.rename, 'replace name at all')
        mapper("n", '<leader>h', function()
            require("conform").format({ async = true, lsp_format = "fallback" })
        end, 'format code')
        mapper("n", "gr", telescope.lsp_references, "go to references")
        mapper("n", "<leader>rs", ":LspRestart<CR>", "restart LSP")
    end,
})

return {
    "mason-org/mason-lspconfig.nvim",
    event = "BufReadPre",
    opts = {
        ensure_installed = {
            "lua_ls",
            "pyright",
            "ruff",
            "ts_ls",
            "html",
            "cssls",
            "tailwindcss",
            "eslint",
            "typos_lsp",
            "sqls",
        },
    },
    dependencies = {
        "stevearc/conform.nvim",
        {"mason-org/mason.nvim",
            opts={
                ui={
                    icons={
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    }
                }
            }
        },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
}
