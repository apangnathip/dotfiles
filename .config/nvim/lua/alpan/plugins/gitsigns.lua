return {
	"lewis6991/gitsigns.nvim",
	event = { "BufRead", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = " █" },
				change = { text = " █" },
				delete = { text = "▁▁" },
				topdelete = { text = "▔▔" },
				changedelete = { text = "~~" },
				untracked = { text = "█" },
			},
			signs_staged = {
				add = { text = "██" },
				change = { text = "██" },
				delete = { text = "▁▁" },
				topdelete = { text = "▔▔" },
				changedelete = { text = "~~" },
				untracked = { text = "█" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })
				map("v", "<leader>ghs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage hunk" })
				map("v", "<leader>ghr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk" })
				map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>ghu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>ghb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame line" })
				map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame line" })
				map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Diff this" })
				map("n", "<leader>ghD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff this" })
				map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "Toggle deleted" })
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
