local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/rcarriga/nvim-notify"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NotifyBackground  = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyDEBUGBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyDEBUGBorder = { fg = Util.blend_bg(c.comment, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyDEBUGIcon   = { fg = c.comment },
    NotifyDEBUGTitle  = { fg = c.comment },
    NotifyERRORBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyERRORBorder = { fg = Util.blend_bg(c.error, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyERRORIcon   = { fg = c.error },
    NotifyERRORTitle  = { fg = c.error },
    NotifyINFOBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyINFOBorder  = { fg = Util.blend_bg(c.info, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyINFOIcon    = { fg = c.info },
    NotifyINFOTitle   = { fg = c.info },
    NotifyTRACEBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyTRACEBorder = { fg = Util.blend_bg(c.gray400, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyTRACEIcon   = { fg = c.gray400 },
    NotifyTRACETitle  = { fg = c.gray400 },
    NotifyWARNBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyWARNBorder  = { fg = Util.blend_bg(c.warning, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyWARNIcon    = { fg = c.warning },
    NotifyWARNTitle   = { fg = c.warning },
  }
end

return M