local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/pwntester/octo.nvim"

---@type repl69.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    OctoDetailsLabel          = { fg = c.orange700, bold = true },
    OctoDetailsValue          = "@variable.member",
    OctoDirty                 = { fg = c.git.dirty, bold = true },
    OctoIssueTitle            = { fg = c.orange, bold = true },
    OctoStateChangesRequested = "DiagnosticVirtualTextWarn",
    OctoStateClosed           = "DiagnosticVirtualTextError",
    OctoStateMerged           = { bg = Util.blend_bg(c.pink700, 0.10), fg = c.pink700 },
    OctoStateOpen             = "DiagnosticVirtualTextHint",
    OctoStatePending          = "DiagnosticVirtualTextWarn",
    OctoStatusColumn          = { fg = c.orange700 },
  }
end

return M
