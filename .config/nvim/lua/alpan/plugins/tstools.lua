return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",
				expose_as_code_action = { "organize_imports", "remove_unused_imports", "add_missing_imports" },
				tsserver_path = nil,
				tsserver_max_memory = "auto",
				tsserver_format_options = {},
				tsserver_file_preferences = {},
				tsserver_locale = "en",
				complete_function_calls = false,
				include_completions_with_insert_text = true,
				code_lens = "off",
				disable_member_code_lens = true,
				tsserver_plugins = {
					"@styled/typescript-styled-plugin",
				},
			},
		})
	end,
}
