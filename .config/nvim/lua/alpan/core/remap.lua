vim.g.mapleader = " "

vim.keymap.set("n", " ", "<Nop>", { noremap = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Yankless paste" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Yankless delete" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Yankless delete" })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlights" })

vim.keymap.set("n", "q", "<C-v>", { desc = "Visual Block" })
vim.keymap.set("n", "<leader>q", "q", { noremap = true, desc = "Record macro" })
