return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>fe",
			function()
				local oil = require("oil")
				oil.toggle_float()
				vim.wait(1000, function()
					return oil.get_cursor_entry() ~= nil
				end)
				if oil.get_cursor_entry() then
					oil.open_preview()
				end
			end,
			desc = "Oil",
		},
	},
	opts = {
		float = {
			padding = 4,
			max_width = 0.9,
			max_height = 0.9,
			border = "rounded",
			preview_split = "right",
		},

		preview_win = {
			update_on_cursor_moved = true,
			preview_method = "fast_scratch",
		},
	},
}
