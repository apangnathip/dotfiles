vim.g.mapleader = " "
vim.g.lisp_rainbow = 1

vim.opt.guicursor = "n-v-c:block-bCursor,i:ver10-iCursor"

vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "

vim.opt.signcolumn = "yes:1"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.showmode = false
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 750

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
