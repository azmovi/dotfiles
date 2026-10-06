return {
	"rose-pine/neovim",
	name = "rose-pine",
	main = "rose-pine",
	event = "VimEnter",
	opts = {
		highlight_groups = {
			["@variable"] = { italic = false },
			["@variable.parameter"] = { italic = false },
			["@variable.member"] = { italic = false },
		},
	},
}
