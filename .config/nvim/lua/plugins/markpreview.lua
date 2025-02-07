return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function ()
        local map = require('helpers.keys').map
        map('n', '<leader>m', '<cmd>MarkdownPreviewToggle<cr>', 'Toggle Markdown')
    end
}
