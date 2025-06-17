local M = {}

M.url = "https://github.com/echasnovski/mini.surround"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniSurround = { bg = c.gray300, fg = c.black },
  }
end

return M