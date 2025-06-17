local M = {}

M.url = "https://github.com/echasnovski/mini.completion"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniCompletionActiveParameter = { underline = true },
  }
end

return M