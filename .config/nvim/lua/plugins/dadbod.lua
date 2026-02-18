return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		local password = os.getenv("VITTUDE_DB")
		local host = os.getenv("VITTUDE_HOST")
		vim.g.dbs = {
			{
				name = "dev",
				url = "mysql://db_aurora_user:" .. password .. "@" .. host .. ":3306/vittude_platform",
			},
		}
	end,
}
