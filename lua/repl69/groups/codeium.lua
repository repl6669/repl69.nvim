local M = {}

M.url = "https://github.com/Exafunction/codeium.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CodeiumSuggestion = { fg = c.gray800 },
  }
  return ret
end

return M