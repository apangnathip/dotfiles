vim.g.mapleader = " "
vim.g.lisp_rainbow = 1

vim.opt.guicursor = "n-v-c:block-bCursor,i:ver10-iCursor"

vim.opt.cursorline = true

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.showmode = false

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

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	command = "silent! lua vim.highlight.on_yank()",
})

vim.diagnostic.config({ underline = true, virtual_text = true })
