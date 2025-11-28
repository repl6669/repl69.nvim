local M = {}

M.url = "https://github.com/nvim-mini/mini.trailspace"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniTrailspace = { bg = c.red },
  }
end

return M
