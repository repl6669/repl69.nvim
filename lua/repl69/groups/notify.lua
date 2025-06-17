local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/rcarriga/nvim-notify"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NotifyBackground  = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    NotifyDEBUGBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    NotifyDEBUGBorder = { fg = c.bg_border_comment, bg = opts.transparent and c.none or c.bg_float },
    NotifyDEBUGIcon   = { fg = c.comment },
    NotifyDEBUGTitle  = { fg = c.comment },
    NotifyERRORBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    NotifyERRORBorder = { fg = c.bg_border_error, bg = opts.transparent and c.none or c.bg_float },
    NotifyERRORIcon   = { fg = c.error },
    NotifyERRORTitle  = { fg = c.error },
    NotifyINFOBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    NotifyINFOBorder  = { fg = c.bg_border_info, bg = opts.transparent and c.none or c.bg_float },
    NotifyINFOIcon    = { fg = c.info },
    NotifyINFOTitle   = { fg = c.info },
    NotifyTRACEBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    NotifyTRACEBorder = { fg = c.bg_border_trace, bg = opts.transparent and c.none or c.bg_float },
    NotifyTRACEIcon   = { fg = c.trace },
    NotifyTRACETitle  = { fg = c.trace },
    NotifyWARNBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    NotifyWARNBorder  = { fg = c.bg_border_warning, bg = opts.transparent and c.none or c.bg_float },
    NotifyWARNIcon    = { fg = c.warning },
    NotifyWARNTitle   = { fg = c.warning },
  }
end

return M

