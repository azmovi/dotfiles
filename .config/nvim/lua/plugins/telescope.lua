return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
	},
	opts = {
		defaults = {
			mappings = {
				n = {
					["<C-CR>"] = "select_vertical",
					["<c-d>"] = "delete_buffer",
				},
				i = {
					["<C-CR>"] = "select_vertical",
					["<c-d>"] = "delete_buffer",
				},
			},
		},
		pickers = {},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function()
		local map = require("core.keymaps").map
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		map("n", "<leader>fg", builtin.live_grep, "Telescope live grep")
		map("n", "<leader>fb", builtin.buffers, "Telescope buffers")
		map("n", "<leader>fl", builtin.diagnostics, "Telescope diagnostics")
		map("n", "<leader>fs", builtin.git_status, "Telescope git status")
		map("n", "<leader>w", builtin.spell_suggest, "Telescope spell sugest")
		map("n", "<leader>ff", function()
			builtin.find_files({ hidden = true, file_ignore_patterns = { "^.git/" } })
		end, "Telescope find files (with dotfiles)")
		telescope.load_extension("fzf")
	end,
}
