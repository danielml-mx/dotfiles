-- Shortcuts
-- make mark navigation easier in LATAM keyboard
vim.keymap.set("n", "'", "`")
vim.keymap.set("n", ",", "'")

-- moving through the same line with gj gk as if they were different lines, bound
vim.keymap.set("n", "<C-j>", "gj")
vim.keymap.set("n", "<C-k>", "gk")
vim.keymap.set("v", "<C-j>", "gj")
vim.keymap.set("v", "<C-k>", "gk")

-- delete previous word quickly [Ctrl+Backspace]
vim.keymap.set("i", "<C-h>", "<C-\\><C-o>db")

-- spell checking
vim.keymap.set("n", "<C-s>", ":setlocal spell! spelllang=es,en_us,de<Enter>")
