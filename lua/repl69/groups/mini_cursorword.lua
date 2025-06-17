local M = {}

M.url = "https://github.com/echasnovski/mini.cursorword"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniCursorword        = { bg = c.gray800 },
    MiniCursorwordCurrent = { bg = c.gray800 },
  }
end

return M