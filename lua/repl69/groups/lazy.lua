local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LazyProgressDone = { bold = true, fg = c.gray200 },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
  }
end

return M