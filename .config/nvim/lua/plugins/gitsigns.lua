return {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
	keys = {
		{
			"<leader>gb",
			function()
				local gitsigns = require("gitsigns")
				gitsigns.toggle_current_line_blame()
			end,
			desc = "Git blame in line",
		},
	},
	opts = {},
}
