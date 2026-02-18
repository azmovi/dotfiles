return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ "<leader>f", function() require("oil").toggle_float() end, desc = "Oil" },
	},
	config = function()
		local oil = require("oil")
		oil.setup({})
	end,
}
