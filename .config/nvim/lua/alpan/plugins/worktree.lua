return {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local worktree = require("git-worktree")
		local telescope = require("telescope")
		telescope.load_extension("git_worktree")

		vim.keymap.set("n", "<leader>pw", function()
			require("telescope").extensions.git_worktree.git_worktrees()
		end, { desc = "List worktrees" })

		vim.keymap.set("n", "<leader>pc", function()
			require("telescope").extensions.git_worktree.create_git_worktree()
		end, { desc = "Create worktree" })

		-- fixes work tree not changing oil directory
		worktree.on_tree_change(function(op, metadata)
			if op == worktree.Operations.Switch and vim.api.nvim_buf_get_name(0):sub(1, 3) == "oil" then
				local path = require("plenary.path")
				local curr_dir_path = vim.api.nvim_buf_get_name(0):sub(7, -1)
				local name = path:new(curr_dir_path):absolute()
				local start, fin = name:find(metadata.prev_path, 1, true)

				if start == nil then
					return
				end

				local local_name = name:sub(fin + 2)
				local final_path = path:new({ vim.loop.cwd(), local_name }):absolute()

				if path:new(final_path):exists() then
					vim.cmd("e " .. final_path)
				else
					vim.cmd("e .")
				end
			end
		end)
	end,
}
