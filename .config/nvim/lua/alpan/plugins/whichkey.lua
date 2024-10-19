return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 1000,
		filter = function(mapping)
			return mapping.desc ~= ""
		end,
		sort = { "local", "group" },
		expand = 2,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
}
