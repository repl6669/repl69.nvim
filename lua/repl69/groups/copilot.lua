local M = {}

M.url = "https://github.com/zbirenbaum/copilot.lua"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    CopilotAnnotation = { fg = c.gray850 },
    CopilotSuggestion = { fg = c.gray850 },
  }
end

return M