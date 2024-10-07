return {
	"rose-pine/neovim",
	priority = 1000,
	config = function()
		local dpurp = "#281e30"
		local pwink = "#bebcd1"

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
				CursorLine = { bg = "none" },
				CursorLineNr = { fg = "white" },
				ColorColumn = { bg = dpurp },
				SignColumn = { bg = dpurp },
				GitSignsAdd = { bg = dpurp },
				GitSignsChange = { bg = dpurp },
				DiagnosticWarn = { bg = dpurp },
				DiagnosticError = { bg = dpurp },
				DiagnosticInfo = { bg = dpurp },
				DiagnosticHint = { bg = dpurp },
			},
		})
		vim.cmd.colorscheme("rose-pine-moon")
	end,
}
