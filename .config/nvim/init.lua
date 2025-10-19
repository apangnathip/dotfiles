vim.g.mapleader = " "
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
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
map("n", "<M-n>", "<C-w>5<")
map("n", "<M-.>", "<C-w>5>")
map("n", "<M-,>", "<C-w>5-")
map("n", "<M-m>", "<C-w>5+")
map("n", "<M-=>", "<C-w>=")
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")
map("v", "L", "xp`[v`]")
map("v", "H", "xhhp`[v`]")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>p", "<cmd>Oil<cr>")
map("n", "<leader>q", "q", { noremap = true })
map("n", "<leader>h", "<cmd>nohlsearch<cr>")
map("n", "grn", "viwo<esc><cmd>lua vim.lsp.buf.rename()<cr>")
map("n", "gwd", vim.diagnostic.open_float)
map("i", "K", vim.lsp.buf.signature_help)
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
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/mbbill/undotree",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/stevearc/dressing.nvim",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-autopairs").setup()
require("mini.surround").setup()
require("dressing").setup()
require("mason").setup()

vim.lsp.enable({ "lua_ls", "bashls", "basedpyright", "clangd", "biome", "fish_lsp" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

require("blink.cmp").setup({
	keymap = {
		["<Tab>"] = {
			function(cmp)
				if cmp.snippet_active() then
					return cmp.accept()
				else
					return cmp.select_and_accept()
				end
			end,
			"snippet_forward",
			"fallback",
		},
	},
	completion = {
		menu = {
			border = "none",
			winhighlight = "Normal:CursorLine,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
		},
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		glsl = { "clang-format" },
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
		bold = false,
	},
	highlight_groups = {
		CursorLine = { bg = "#1f1726" },
		CursorLineNr = { fg = "white" },
		SignColumn = { bg = "none" },
		["@function.builtin"] = { fg = "#eb6f92" },
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
		["<C-h>"] = {},
		["<C-l>"] = {},
		["<C-s>"] = {},
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
		live_grep = {
			additional_args = { "--hidden", "-L" },
		},
	},
})
telescope.load_extension("fzf")

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

map("n", "<leader>f", builtin.find_files)
map("n", "<leader>l", builtin.live_grep)
map("n", "<leader>b", builtin.buffers)
map("n", "<leader>ss", builtin.builtin)
map("n", "<leader>sh", builtin.help_tags)
map("n", "<leader>sm", builtin.man_pages)
map("n", "<leader>vpc", pack_clean)
map("n", "<leader>u", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>")
map("n", "<leader>c", require("conform").format)
map("n", "<leader>gs", "<cmd>Git<cr>")

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("RemoveNLComment", { clear = true }),
	pattern = "*",
	command = "setlocal formatoptions-=cro",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("CStyleIndent", { clear = true }),
	pattern = "cpp",
	command = "set tabstop=4 shiftwidth=4",
})
