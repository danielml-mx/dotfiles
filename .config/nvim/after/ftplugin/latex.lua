-- Settings and bindings specific to .tex files

vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true

vim.keymap.set("n", "<F5>", ":w<CR>:exec '!pdflatex' shellescape(@%, 1)<CR>", {buffer = true})
vim.keymap.set("i", "<F5>", "<Esc>:w<CR>:exec '!pdflatex' shellescape(@%, 1)<CR>", {buffer = true})
vim.keymap.set("n", "<F4>", ":w<CR>:exec '!lualatex' shellescape(@%, 1)<CR>", {buffer = true})
vim.keymap.set("i", "<F4>", "<Esc>:w<CR>:exec '!lualatex' shellescape(@%, 1)<CR>", {buffer = true})

