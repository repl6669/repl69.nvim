local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/phaazon/hop.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    HopNextKey = { fg = c.gray200, bold = styles.keywords.bold },
    HopNextKey1 = { fg = c.gray300, bold = styles.keywords.bold },
    HopNextKey2 = { fg = Util.blend_bg(c.gray400, 0.6) },
    HopUnmatched = { fg = c.gray850 },
  }
end

return M