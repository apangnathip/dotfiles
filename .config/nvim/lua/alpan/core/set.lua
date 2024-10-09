local opt = vim.opt

vim.g.mapleader = " "

opt.guicursor = "n-v-c:block-bCursor,i:ver10-iCursor"

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.cursorline = true
opt.relativenumber = true
opt.number = true
opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "

opt.signcolumn = "yes:1"

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.showmode = false
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.termguicolors = true

opt.scrolloff = 8

opt.updatetime = 750

opt.fillchars = {
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}

vim.api.nvim_set_hl(0, "CursorReset", { bg = "#ffffff", fg = "#ffffff" })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "setlocal formatoptions-=cro" })
vim.api.nvim_create_autocmd("VimLeave", { pattern = "*", command = "set guicursor=a:ver100-CursorReset" })
vim.api.nvim_create_autocmd("TextYankPost", { pattern = "*", command = "silent! lua vim.highlight.on_yank()" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "set tabstop=4 shiftwidth=4" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "set tabstop=4 shiftwidth=4" })
vim.api.nvim_create_autocmd(
	"BufRead",
	{ pattern = "*.vert,*.frag,", command = "set filetype=glsl tabstop=4 shiftwidth=4" }
)

vim.diagnostic.config({ underline = true, virtual_text = true })
