-- Open file with cursor in previous position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("RestoreCursor", { clear = true }),
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local last_line = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= last_line then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
