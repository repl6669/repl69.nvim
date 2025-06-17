local M = {}

M.url = "https://github.com/supermaven-inc/supermaven-nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    SupermavenSuggestion = { fg = c.gray800 },
  }
  return ret
end

return M