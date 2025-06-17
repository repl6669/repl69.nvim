local M = {}

M.url = "https://github.com/echasnovski/mini.trailspace"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniTrailspace = { bg = c.red },
  }
end

return M