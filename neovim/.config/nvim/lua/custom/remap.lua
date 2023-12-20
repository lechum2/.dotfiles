vim.g.mapleader = " "
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>yp", function() vim.fn.setreg('+', vim.fn.expand('%:p')) end)
vim.keymap.set("n", "<leader>yf", function() vim.fn.setreg('+', vim.fn.expand('%:t')) end)
vim.keymap.set("n", "<leader>yr", function() vim.fn.setreg('+', vim.fn.expand('%')) end)
