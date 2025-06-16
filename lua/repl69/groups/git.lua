local M = {}

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Git diff highlights
    Added                       = { fg = c.git.add },
    Changed                     = { fg = c.git.change },
    Removed                     = { fg = c.git.delete },
  }
end

return M