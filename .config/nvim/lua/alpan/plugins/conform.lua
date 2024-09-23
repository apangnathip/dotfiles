return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters = {
				biome = {
					env = {
						BIOME_CONFIG_PATH = "~/.config/",
					},
				},
			},
			formatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				html = { "biome" },
				css = { "biome" },
				json = { "biome" },
				markdown = { "biome" },
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clangd" },
			},
			format_after_save = {
				lsp_format = "fallback",
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				timeout_ms = 500,
			})
		end, { desc = "Format" })
	end,
}
