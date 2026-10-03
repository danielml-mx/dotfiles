-- Settings and bindings specific to .py files

vim.keymap.set("n", "<F5>" ":w<Enter>:exec '!st python -i' shellescape(@%, 1)<Enter>", {buffer = true})
vim.keymap.set("i", "<F5>" "<Esc>:w<Enter>:exec '!st python -i' shellescape(@%, 1)<Enter>", {buffer = true})


