local M = {}

M.url = "https://github.com/zbirenbaum/copilot.lua"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    CopilotAnnotation = { fg = c.comment },
    CopilotSuggestion = { fg = c.comment },
  }
end

return M

