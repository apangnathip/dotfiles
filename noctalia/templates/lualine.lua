return {
	normal = {
		a = { fg = "{{colors.primary.default.hex}}", bg = "{{colors.on_primary.default.hex}}"},
		b = { fg = "{{colors.primary.default.hex}}", bg = "{{colors.inverse_primary.default.hex}}"},
		c = { fg = "{{colors.primary.default.hex}}", bg = "none"},
	},
	insert = { a = { fg = "{{colors.on_secondary.default.hex}}", bg = "{{colors.secondary.default.hex}}", gui = "bold" } },
	visual = { a = { fg = "{{colors.on_tertiary.default.hex}}", bg = "{{colors.tertiary.default.hex}}", gui = "bold" } },
	replace = { a = { fg = "{{colors.on_secondary_container.default.hex}}", bg = "{{colors.secondary_container.default.hex}}", gui = "bold" } },
	inactive = {
		a = { fg = "{{colors.on_primary.default.hex}}", bg = "{{colors.primary.default.hex}}"},
		b = { fg = "{{colors.primary.default.hex}}", bg = "{{colors.inverse_primary.default.hex}}"},
		c = { fg = "{{colors.primary.default.hex}}", bg = "none"},
	},
}
