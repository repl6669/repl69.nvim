local M = {}

M.url = "https://github.com/echasnovski/mini.statusline"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    MiniStatuslineDevinfo     = { fg = c.gray500, bg = c.gray800 },
    MiniStatuslineFileinfo    = { fg = c.gray500, bg = c.gray800 },
    MiniStatuslineFilename    = { fg = c.gray500, bg = c.bg_highlight },
    MiniStatuslineInactive    = { fg = c.gray200, bg = c.bg_statusline },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.gray400, bold = styles.keywords.bold },
    MiniStatuslineModeInsert  = { fg = c.black, bg = c.gray300, bold = styles.keywords.bold },
    MiniStatuslineModeNormal  = { fg = c.black, bg = c.gray200, bold = styles.keywords.bold },
    MiniStatuslineModeOther   = { fg = c.black, bg = c.gray500, bold = styles.keywords.bold },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.gray600, bold = styles.keywords.bold },
    MiniStatuslineModeVisual  = { fg = c.black, bg = c.gray100, bold = styles.keywords.bold },
  }
end

return M