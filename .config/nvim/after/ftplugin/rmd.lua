-- Settings and bindings specific to .Rmd files

vim.keymap.set("i", "<C-r>", "```{r}<Enter>```<Esc>O", {buffer = true})
vim.keymap.set("n", "<F5>", ":w<Enter>:!Rscript -e \"rmarkdown::render('%:p', output_format = 'pdf_document')\"<CR>", {buffer = true})
vim.keymap.set("i", "<F5>", "<Esc>:w<Enter>:!Rscript -e \"rmarkdown::render('%:p', output_format = 'pdf_document')\"<CR>", {buffer = true})
