local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/echasnovski/mini.diff"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniDiffOverAdd     = "DiffAdd",
    MiniDiffOverChange  = "DiffText",
    MiniDiffOverContext = "DiffChange",
    MiniDiffOverDelete  = "DiffDelete",
    MiniDiffSignAdd     = { fg = Util.blend_bg(c.git.add, 0.60) },
    MiniDiffSignChange  = { fg = Util.blend_bg(c.git.change, 0.60) },
    MiniDiffSignDelete  = { fg = Util.blend_bg(c.git.delete, 0.60) },
  }
end

return M

