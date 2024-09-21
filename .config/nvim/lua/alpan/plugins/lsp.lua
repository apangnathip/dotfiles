return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"rafamadriz/friendly-snippets",
				"onsails/lspkind-nvim",
			},
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			local cmp = require("cmp")

			require("luasnip/loaders/from_vscode").lazy_load()

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				completion = {
					completeopt = "menu,preview,menuone,noselect",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				window = {
					completion = {
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
						col_offset = -3,
						side_padding = 0,
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = require("lspkind").cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"
						return kind
					end,
				},
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			local lsp_zero = require("lsp-zero")
			local lspconfig = require("lspconfig")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("i", "<C-k>", function()
					vim.lsp.buf.signature_help()
				end, opts)
				vim.keymap.set("n", "<leader>ws", function()
					vim.lsp.buf.workspace_symbol()
				end, { buffer = bufnr, remap = false, desc = "Workspace symbol" })
				vim.keymap.set("n", "<leader>e", function()
					vim.diagnostic.open_float()
				end, { buffer = bufnr, remap = false, desc = "Diagnostics" })
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, { buffer = bufnr, remap = false, desc = "Code actions" })
				vim.keymap.set("n", "<leader>rr", function()
					vim.lsp.buf.references()
				end, { buffer = bufnr, remap = false, desc = "References" })
				vim.keymap.set("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, { buffer = bufnr, remap = false, desc = "Rename" })
			end)

			require("mason-tool-installer").setup({
				ensure_installed = {
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"emmet_ls",
					"clangd",
					"pyright",
					"stylua",
					"prettierd",
					"black",
					"isort",
					"elixirls",
					"rust_analyzer",
				},
				run_on_start = true,
				auto_start = true,
			})

			require("mason-lspconfig").setup({
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						lspconfig.lua_ls.setup(lua_opts)
					end,
					cssls = function()
						lspconfig.cssls.setup({
							settings = {
								css = {
									validate = true,
									lint = {
										unknownAtRules = "ignore",
									},
								},
							},
						})
					end,
					rust_analyzer = function()
						return true
					end,
				},
			})
		end,
	},
}
