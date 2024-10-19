return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local trans_auto = require("lualine.themes.auto")

		local colors = {
			primary = "#bebcd1",
			secondary = "#908caa",
			black = "#29273c",
			dpurp = "#281e30",
		}

		trans_auto.normal.a.bg = colors.primary
		trans_auto.normal.a.fg = colors.black
		trans_auto.normal.b.bg = colors.secondary
		trans_auto.normal.b.fg = colors.black
		trans_auto.normal.c.bg = colors.dpurp
		trans_auto.insert.c.bg = colors.dpurp
		trans_auto.visual.c.bg = colors.dpurp
		trans_auto.replace.c.bg = colors.dpurp
		trans_auto.command.c.bg = colors.dpurp
		trans_auto.inactive.c.bg = colors.dpurp

		require("lualine").setup({
			options = {
				theme = trans_auto,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
