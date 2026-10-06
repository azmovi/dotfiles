local function toggle_image()
	local buf = vim.api.nvim_get_current_buf()
	local doc = require("snacks.image.doc")

	local function close()
		doc.hover_close()
		vim.b[buf].snacks_image_open = false
		pcall(vim.keymap.del, "n", "q", { buffer = buf })
		pcall(vim.keymap.del, "n", "<Esc>", { buffer = buf })
	end

	if vim.b[buf].snacks_image_open then
		return close()
	end

	Snacks.image.hover()
	vim.b[buf].snacks_image_open = true
	vim.keymap.set("n", "q", close, { buffer = buf, nowait = true, desc = "Close image" })
	vim.keymap.set("n", "<Esc>", close, { buffer = buf, nowait = true, desc = "Close image" })
	vim.api.nvim_create_autocmd({ "CursorMoved", "ModeChanged", "BufLeave" }, {
		buffer = buf,
		once = true,
		callback = close,
	})
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		image = {
			enabled = true,
			doc = {
				inline = false,
				float = false,
				max_width = 120,
				max_height = 40,
			},
		},
	},
	keys = {
		{ "<leader>si", toggle_image, desc = "Toggle image/diagram under cursor" },
	},
}
