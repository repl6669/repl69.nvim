local Util = require("repl69.util")
local M = {}

M.url = "https://github.com/williamboman/mason.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles
  -- stylua: ignore
  return {
    MasonHeader =                       { fg = c.black, bg = c.orange500 },
    MasonHighlight =                    { fg = Util.blend_bg(c.orange500, 0.60) },
    MasonHighlightBlock =               { fg = c.black, bg = c.orange500 },
    MasonHighlightBlockBold =           { fg = c.black, bg = c.orange500, bold = styles.keywords.bold },
    MasonHighlightSecondary =           { fg = c.cyan700 },
    MasonHighlightBlockSecondary =      { fg = c.fg, bg = c.cyan700 },
    MasonHighlightBlockBoldSecondary =  { fg = c.fg, bg = c.cyan700, bold = styles.keywords.bold },
    MasonMuted =                        { fg = c.gray500 },
    MasonMutedBlock =                   { fg = c.gray500, bg = Util.blend_bg(c.fg, 0.10) },
    MasonMutedBlockBold =               { fg = c.gray500, bg = c.bg, bold = styles.keywords.bold },
  }
end

return M
