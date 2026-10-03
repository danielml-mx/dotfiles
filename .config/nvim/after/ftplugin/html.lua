-- Settings and bindings specific to .html files

vim.keymap.set("n", "<F5>", ":w<Enter>:exec '!librewolf' shellescape(@%, 1)<Enter>", {buffer = true}))
vim.keymap.set("i", "<F5>", "<Esc>:w<Enter>:exec '!librewolf' shellescape(@%, 1)<Enter>", {buffer = true}))

-- TODO revisar
-- Tag snippets: ;<key> inserts the tag and puts the cursor between them
local tags = {
  it  = { "<i>", "</i>" },
  bf  = { "<b>", "</b>" },
  em  = { "<em>", "</em>" },
  url = { "<a href=''>", "</a>" },
  h1  = { "<h1>", "</h1>" },
  h2  = { "<h2>", "</h2>" },
  h3  = { "<h3>", "</h3>" },
  p   = { "<p>", "</p>" },
  jp  = { '<p class="j">', "</p>" },
}

for key, t in pairs(tags) do
  map("i", ";" .. key, t[1] .. t[2] .. string.rep("<Left>", #t[2]))
end
