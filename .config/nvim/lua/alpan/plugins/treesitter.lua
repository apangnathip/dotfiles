return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"c",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"vimdoc",
				"gitignore",
				"query",
				"xml",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			auto_install = true,
			sync_install = false,
		})
	end,
}
