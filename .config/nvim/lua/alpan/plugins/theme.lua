return {
	"rose-pine/neovim",
	priority = 1000,
	config = function()
		local dpurp = "#281e30"

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
				GitSignsDelete = { bg = dpurp },
				DiagnosticWarn = { bg = dpurp },
				DiagnosticError = { bg = dpurp },
				DiagnosticInfo = { bg = dpurp },
				DiagnosticHint = { bg = dpurp },
				WinSeparator = { fg = dpurp, bold = true },
			},
		})
		vim.cmd.colorscheme("rose-pine-moon")
	end,
}
