-- Settings and bindings specific to .c/.h files

vim.keymap.set("", "<F5>", ":w<Enter>:exec '!g++' shellescape(@%, 1)<Enter>", {buffer = true})
vim.keymap.set("", "<F5>", "<Esc>:w<Enter>:exec '!g++' shellescape(@%, 1)<Enter>", {buffer = true})


