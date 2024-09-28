return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
		vim.keymap.set("n", "<leader>pb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "Find string" })
	end,
}
