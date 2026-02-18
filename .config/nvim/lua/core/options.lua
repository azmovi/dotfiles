local opts = {
    expandtab = true,
    smarttab = true,
    tabstop = 4,
    shiftwidth = 4,
    autoindent = true,

    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    smartcase = true,

    splitbelow = true,
    splitright = true,
    wrap = false,
    scrolloff = 10,
    sidescrolloff = 20,
    fileencoding = "utf-8",
    termguicolors = true,

    title = true,
    titlestring = "nvim %{expand('%:p')}",

    number = true,
    relativenumber = true,
    cursorline = true,
    mouse = "a",
    colorcolumn = "80",
    signcolumn = "yes",
    completeopt = { "menu", "menuone", "noselect" },
    spelllang = "pt,en",
    foldmethod = "indent",
    fillchars = {
    fold = " ",
    },
    foldenable = true,
    foldlevel = 99,
    foldminlines = 1,
}

-- Apply options
for opt, val in pairs(opts) do
  vim.opt[opt] = val
end

-- Transparent background
vim.cmd([[
  highlight Normal guibg=none ctermbg=none
  highlight NonText guibg=none ctermbg=none
]])

_G.custom_fold_text = function()
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  return string.format("   %d lines", line_count)
end

vim.opt.foldtext = "v:lua.custom_fold_text()"

-- Disable unused providers
vim.g.loaded_python_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
