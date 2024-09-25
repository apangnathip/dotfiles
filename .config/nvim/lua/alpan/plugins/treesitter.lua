return {
	{

		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
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
					"svelte",
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
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "Select around function" },
							["if"] = { query = "@function.inner", desc = "Select inside function" },
							["q="] = { query = "@assignment.lhs", desc = "Select LHS of assignment" },
							["r="] = { query = "@assignment.rhs", desc = "Select RHS of assignment" },
							["ai"] = { query = "@conditional.outer", desc = "Select around conditional" },
							["ii"] = { query = "@conditional.inter", desc = "Select inside conditional" },
							["al"] = { query = "@loop.outer", desc = "Select around loop" },
							["il"] = { query = "@loop.inner", desc = "Select inside loop" },
						},
					},
				},
			})
		end,
	},
}
