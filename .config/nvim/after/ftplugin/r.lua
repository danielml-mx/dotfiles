-- Settings and bindings specific to .r files

vim.keymap.set("n", "<F5>", ":w<Enter>:exec '!Rscript' shellescape(@%, 1)<Enter>"   , {buffer = true})
vim.keymap.set("i", "<F5>", "<Esc>:w<Enter>:exec '!Rscript' shellescape(@%, 1)<Enter>", {buffer = true})


