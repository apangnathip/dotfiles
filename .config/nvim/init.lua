vim.g.mapleader = " "
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.relativenumber = true
vim.o.number = true
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.cursorline = true
vim.o.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "
vim.o.signcolumn = "yes:1"
vim.o.ignorecase = true
vim.o.winborder = "rounded"
vim.o.showmode = false

local map = vim.keymap.set
map("i", "jk", "<Esc>")
map("n", ";", ":")
map("n", ":", ";")
map("n", " ", "<Nop>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "x", '"_x')
map("n", "q", "<C-v>")
map("n", "<M-,>", "<C-w>5<")
map("n", "<M-.>", "<C-w>5>")
map("n", "<M-m>", "<C-w>5-")
map("n", "<M-n>", "<C-w>5+")
map("n", "<M-=>", "<C-w>=")
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")
map("v", "L", "xp`[v`]")
map("v", "H", "xhhp`[v`]")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>pv", "<cmd>Oil<cr>")
map("n", "<leader>q", "q", { noremap = true })
map("n", "<leader>h", "<cmd>nohlsearch<cr>")
map("n", "<leader>v", "<cmd>e ~/.config/nvim/init.lua<cr>")
map("n", "<leader>e", vim.diagnostic.open_float)
map("i", "K", vim.lsp.buf.signature_help)
map("n", "<leader>rn", vim.lsp.buf.rename)
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>d", '"_d')

vim.pack.add({
	"https://github.com/rose-pine/neovim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/aznhe21/actions-preview.nvim",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/mbbill/undotree",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/github/copilot.vim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("mini.surround").setup()
require("blink.cmp").setup()
require("nvim-autopairs").setup()
require("mason").setup()

vim.lsp.enable("lua_ls", "bashls", "basedpyright", "clangd", "biome", "fish_lsp")
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		javascript = { "biome" },
		typescript = { "biome" },
		html = { "biome" },
		css = { "biome" },
		json = { "biome" },
		sh = { "shfmt" },
	},
})

require("rose-pine").setup({
	styles = {
		transparency = true,
		italic = false,
	},
	highlight_groups = {
		CursorLine = { bg = "#1f1726" },
		CursorLineNr = { fg = "white", bold = false },
		SignColumn = { bg = "none" },
	},
})
vim.cmd.colorscheme("rose-pine-moon")

local theme = require("lualine.themes.auto")
theme.normal.a.bg = "#bebcd1"
theme.normal.a.fg = "#29273c"
theme.normal.b.bg = "#908caa"
theme.normal.b.fg = "#29273c"
theme.normal.c.bg = "#281e30"
theme.insert.c.bg = "#281e30"
theme.visual.c.bg = "#281e30"
theme.replace.c.bg = "#281e30"
theme.command.c.bg = "#281e30"
theme.inactive.c.bg = "#281e30"

require("lualine").setup({
	options = {
		theme = theme,
		component_separators = { left = "", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "branch", icons_enabled = false } },
		lualine_c = { "filename" },
		lualine_x = { { "filetype", icons_enabled = false } },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

require("oil").setup({
	delete_to_trash = true,
	watch_for_changes = true,
	lsp_file_methods = { autosave_changes = true },
	view_options = { show_hidden = true },
	keymaps = {
		["g%"] = { "actions.select", opts = { vertical = true } },
		['g"'] = { "actions.select", opts = { horizontal = true } },
		["gr"] = "actions.refresh",
	},
})

local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "IndentHL", { fg = "#22192a" })
end)
require("ibl").setup({
	scope = { enabled = false },
	indent = {
		highlight = {
			"IndentHL",
		},
	},
})

local telescope = require("telescope")
telescope.setup({
	defaults = {
		preview = { treesitter = false },
		path_displays = { "smart" },
		sorting_strategy = "ascending",
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		layout_config = {
			height = 100,
			width = 400,
			prompt_position = "top",
			preview_cutoff = 40,
		},
	},
	pickers = {
		find_files = {
			follow = true,
			hidden = true,
		},
	},
})
telescope.load_extension("fzf")

require("actions-preview").setup({
	telescope = {
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			width = 0.8,
			height = 0.9,
			prompt_position = "top",
			preview_cutoff = 20,
			preview_height = function(_, _, max_lines)
				return max_lines - 15
			end,
		},
	},
})

require("gitsigns").setup({
	signs = {
		add = { text = "█" },
		change = { text = "█" },
		delete = { text = "▁" },
		topdelete = { text = "▔" },
		changedelete = { text = "~" },
		untracked = { text = "█" },
	},
	signs_staged = {
		add = { text = "█" },
		change = { text = "█" },
		delete = { text = "▁" },
		topdelete = { text = "▔" },
		changedelete = { text = "~" },
		untracked = { text = "█" },
	},
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHL", { clear = true }),
	pattern = "*",
	command = "silent! lua vim.hl.on_yank()",
})

vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("fzfUpdate", { clear = true }),
	callback = function(args)
		if args.data.spec.name == "telescope-fzf-native.nvim" and args.data.kind ~= "delete" then
			vim.notify(args.data.spec.name .. " has been updated.")
			vim.schedule(function()
				vim.system({ "make" }, { cwd = args.data.path })
			end)
		end
	end,
})

local function pack_clean()
	local unused = {}

	for _, plugin in ipairs(vim.pack.get()) do
		if not plugin.active then
			table.insert(unused, plugin.spec.name)
		end
	end

	if #unused == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins: " .. table.concat(unused, ", ") .. "?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused)
	end
end

local builtin = require("telescope.builtin")
map("n", "<leader>pf", builtin.find_files)
map("n", "<leader>ps", builtin.live_grep)
map("n", "<leader>pb", builtin.buffers)
map("n", "<leader>pw", builtin.grep_string)
map("n", "<leader>pt", builtin.builtin)
map("n", "<leader>ca", require("actions-preview").code_actions)
map("n", "<leader>vpc", pack_clean)
map("n", "<leader>u", "<cmd>UndotreeToggle<cr><cmd>UndoTreeFocus<cr>")
map("n", "<leader>f", require("conform").format)
map("n", "<leader>gs", "<cmd>Git<cr>")
