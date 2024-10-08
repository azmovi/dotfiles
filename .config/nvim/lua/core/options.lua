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
    fileencoding = 'utf-8',
    termguicolors = true,
    title = true,

    number = true,
    relativenumber = true,
    cursorline = true,
    hidden = true,
    mouse = 'a',
    colorcolumn = '80',
    signcolumn = 'yes',
    completeopt = { 'menu', 'menuone', 'noselect' },
    spelllang = { 'pt', 'en' },

    foldenable = true,
    foldlevel = 99,
    foldminlines = 1,
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.opt[opt] = val
end

-- Background transparent
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- Loaded provider
vim.g.loaded_python_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
