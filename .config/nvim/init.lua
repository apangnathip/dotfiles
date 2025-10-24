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
vim.o.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>")
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", " ", "<Nop>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "q", "<C-v>")
vim.keymap.set("n", "<M-n>", "<C-w>5<")
vim.keymap.set("n", "<M-.>", "<C-w>5>")
vim.keymap.set("n", "<M-,>", "<C-w>5-")
vim.keymap.set("n", "<M-m>", "<C-w>5+")
vim.keymap.set("n", "<M-=>", "<C-w>=")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "L", "xp`[v`]")
vim.keymap.set("v", "H", "xhhp`[v`]")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>p", "<cmd>Oil<cr>")
vim.keymap.set("n", "<leader>q", "q", { noremap = true })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "gwd", vim.diagnostic.open_float)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "grn", vim.lsp.buf.rename)
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set({ "n", "v" }, ":", ";")

vim.pack.add({
	"file:///home/alpan/proj/inline-rename",
	"https://github.com/rose-pine/neovim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/mbbill/undotree",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/folke/flash.nvim",
	"https://github.com/tpope/vim-dispatch",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})

require("nvim-autopairs").setup()
require("mini.surround").setup()
require("mason").setup()

-- {{{ Utils
local utils = {
	contains = function(tab, val)
		for _, v in ipairs(tab) do
			if v == val then
				return true
			end
		end
		return false
	end,
	pack_clean = function()
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
	end,
}

table.unpack = table.unpack or unpack
vim.api.nvim_create_user_command("PackClean", utils.pack_clean, {})
-- }}}

-- {{{ Treesitter
vim.keymap.set({ "x", "o" }, "as", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
end)
vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ai", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ii", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "al", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "il", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
end)
-- }}}

-- {{{ Navigation
require("oil").setup({
	delete_to_trash = true,
	watch_for_changes = true,
	skip_confirm_for_simple_edits = true,
	lsp_file_methods = { autosave_changes = true },
	view_options = { show_hidden = true },

	keymaps = {
		["gr"] = "actions.refresh",
		["<C-s>"] = { "actions.select", opts = { horizontal = true } },
		["<C-v>"] = { "actions.select", opts = { vertical = true } },
		["<C-h>"] = {},
		["<C-l>"] = {},
	},
})

local fzf = require("fzf-lua")

fzf.setup({
	grep = {
		hidden = true,
		follow = true,
	},
	helptags = {
		actions = {
			["enter"] = fzf.actions.help_vert,
		},
	},
	manpages = {
		previewer = "man_native",
		actions = {
			["enter"] = fzf.actions.man_vert,
		},
	},
})

vim.keymap.set("n", "<leader>f", fzf.files)
vim.keymap.set("n", "<leader>b", fzf.buffers)
vim.keymap.set("n", "<leader>l", fzf.live_grep)
vim.keymap.set("n", "<leader>sh", fzf.helptags)
vim.keymap.set("n", "<leader>ss", fzf.builtin)
vim.keymap.set("n", "<leader>sm", fzf.man_pages)

vim.keymap.set({ "n", "x", "o" }, "<cr>", function()
	require("flash").jump()
end)
vim.keymap.set({ "n", "x", "o" }, "<s-cr>", function()
	require("flash").treesitter()
end)
vim.keymap.set("o", "r", function()
	require("flash").remote()
end)
vim.keymap.set({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end)
vim.keymap.set({ "c" }, "<c-s>", function()
	require("flash").toggle()
end)
-- }}}

-- {{{ LSP
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

local blink = require("blink.cmp")
blink.setup({
	keymap = {
		["<Tab>"] = {
			function(cmp)
				if not cmp.snippet_active() then
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
		javascript = { "biome" },
		typescript = { "biome" },
		html = { "biome" },
		css = { "biome" },
		json = { "biome" },
		sh = { "shfmt" },
	},
})

vim.keymap.set("n", "<leader>c", require("conform").format)
vim.keymap.set("n", "grn", require("inline-rename").rename)
-- }}}

-- {{{ Theme
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
-- }}}

-- {{{ Autocmds
local al_au = vim.api.nvim_create_augroup("alpan", { clear = true })
local ts_au = vim.api.nvim_create_augroup("nvim_treesitter", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
	group = ts_au,
	callback = function(args)
		local plugins = { "nvim-treesitter", "nvim-treesitter-textobjects" }
		if utils.contains(plugins, args.data.spec.name) and args.data.kind ~= "delete" then
			vim.schedule(function()
				vim.cmd("TSUpdate")
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = ts_au,
	pattern = "*",
	callback = function(ev)
		local nvim_ts = require("nvim-treesitter")
		local parser = vim.treesitter.language.get_lang(ev.match)

		if not utils.contains(nvim_ts.get_available(), parser) then
			return
		end

		if not utils.contains(nvim_ts.get_installed(), parser) then
			nvim_ts.install({ parser }):wait(300000)
		end

		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = al_au,
	pattern = "*",
	command = "lua vim.hl.on_yank()",
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = al_au,
	pattern = "*",
	command = "setlocal formatoptions-=cro",
})

vim.api.nvim_create_autocmd("FileType", {
	group = al_au,
	pattern = "cpp",
	callback = function()
		vim.cmd("set tabstop=4 shiftwidth=4")
		vim.cmd("let b:dispatch = 'cmake --build build'")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = al_au,
	pattern = "python",
	command = "let b:dispatch = 'python3 %'",
})

vim.api.nvim_create_autocmd("FileType", {
	group = al_au,
	pattern = "python",
	command = "let b:dispatch = 'python3 %'",
})
-- }}}

-- vim: foldmethod=marker foldlevel=0
