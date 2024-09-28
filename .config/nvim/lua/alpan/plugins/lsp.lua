return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
		},
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-y>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local keymap = vim.keymap.set

			local on_attach = function(_, bufnr)
				local buf_opts = { buffer = bufnr, silent = true }
				keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", buf_opts)
				keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", buf_opts)
				keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<cr>", buf_opts)
				keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", buf_opts)
				keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", buf_opts)
				keymap("n", "<leader>ws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", buf_opts)
				keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", buf_opts)
				keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", buf_opts)
				keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.references()<cr>", buf_opts)
				keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", buf_opts)
			end

			require("mason").setup()

			require("mason-tool-installer").setup({
				ensure_installed = {
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"emmet_ls",
					"clangd",
					"biome",
					"pyright",
					"stylua",
					"black",
					"isort",
					"elixirls",
					"rust_analyzer",
					"jsonls",
				},
				run_on_start = true,
				auto_start = true,
			})

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local opts = {
						on_attach = on_attach,
						capabilities = capabilities,
					}
					lspconfig[server_name].setup(opts)
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			})
		end,
	},
}
