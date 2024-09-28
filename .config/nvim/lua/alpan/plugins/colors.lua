return {
	"rose-pine/neovim",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			dim_inactive_windows = false,
			styles = {
				transparency = true,
				italic = false,
			},
			highlight_groups = {
				iCursor = { bg = "white" },
				bCursor = { bg = "Muted" },
				CursorLine = { bg = "#281e30" },
			},
		})
		vim.cmd.colorscheme("rose-pine-moon")
	end,
}
