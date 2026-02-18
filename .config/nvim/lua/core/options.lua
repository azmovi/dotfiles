local opts = {
	expandtab = true,
	smarttab = true,
	tabstop = 4,
	shiftwidth = 4,

	autoindent = true,
	smartindent = true,
	copyindent = true,

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
	showmode = false,

	colorcolumn = "80",
	signcolumn = "yes",
	completeopt = { "menu", "menuone", "noselect" },
	spelllang = "pt,en",

	foldmethod = "indent",
	foldenable = true,
	foldlevel = 99,
	foldminlines = 1,

	swapfile = false,
	backup = false,
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

vim.g.loaded_python_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
