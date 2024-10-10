local set = vim.keymap.set
vim.g.mapleader = " "

set("n", " ", "<Nop>", { noremap = true })

set("i", "jk", "<Esc>", { noremap = true })
set("n", "x", '"_x')

set("v", "J", ":m +1<CR>gv=gv")
set("v", "K", ":m -2<CR>gv=gv")
set("v", "L", "xp`[v`]")
set("v", "H", "xhhp`[v`]")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

set("x", "<leader>p", '"_dP', { desc = "Yankless paste" })
set("n", "<leader>d", '"_d', { desc = "Yankless delete" })
set("v", "<leader>d", '"_d', { desc = "Yankless delete" })

set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })

set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlights" })

set("n", "q", "<C-v>", { desc = "Visual Block" })

set("n", "<leader>q", "q", { noremap = true, desc = "Record macro" })

set("n", "<M-,>", "<C-w>5<", { desc = "Decrease pane width" })
set("n", "<M-.>", "<C-w>5>", { desc = "Increase pane width" })
set("n", "<M-m>", "<C-w>5-", { desc = "Decrease pane height" })
set("n", "<M-n>", "<C-w>5+", { desc = "Increase pane height" })
set("n", "<M-=>", "<C-w>=", { desc = "Equalize width and height" })
