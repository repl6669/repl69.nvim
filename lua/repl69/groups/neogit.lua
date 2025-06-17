local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/TimUntersberger/neogit"

---@type repl69.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    NeogitBranch               = { fg = c.pink },
    NeogitRemote               = { fg = c.purple },
    NeogitHunkHeader           = { bg = c.bg_dark, fg = c.fg },
    NeogitHunkHeaderHighlight  = { bg = c.bg_dark, fg = c.blue },
    NeogitDiffContextHighlight = { bg = Util.blend_bg(c.gray800, 0.5), fg = c.gray400 },
    NeogitDiffDeleteHighlight  = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight     = { fg = c.git.add, bg = c.diff.add },
  }
end

return M
