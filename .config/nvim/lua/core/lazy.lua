local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

require("helpers.keys").set_leader(" ")

lazy.setup({
    { import = "plugins" },
    { import = "plugins.lsp.lsp" },
})

-- Colorscheme
local colorscheme = require('helpers.colorscheme')
vim.cmd.colorscheme(colorscheme)
