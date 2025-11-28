local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/nvim-mini/mini.tabline"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniTablineCurrent         = { fg = c.fg, bg = c.gray800 },
    MiniTablineFill            = { bg = c.black },
    MiniTablineHidden          = { fg = c.gray750, bg = c.bg_statusline },
    MiniTablineModifiedCurrent = { fg = c.warning, bg = c.gray800 },
    MiniTablineModifiedHidden  = { bg = c.bg_statusline, fg = Util.blend_bg(c.warning, 0.7) },
    MiniTablineModifiedVisible = { fg = c.warning, bg = c.bg_statusline },
    MiniTablineTabpagesection  = { bg = c.gray800, fg = c.none },
    MiniTablineVisible         = { fg = c.fg, bg = c.bg_statusline },
  }
end

return M
