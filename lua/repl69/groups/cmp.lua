local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CmpDocumentation       = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg_float },
    CmpGhostText           = { fg = c.gray800 },
    CmpItemAbbr            = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated  = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch       = { fg = c.gray200, bg = c.none },
    CmpItemAbbrMatchFuzzy  = { fg = c.gray200, bg = c.none },
    CmpItemKindCodeium     = { fg = c.gray300, bg = c.none },
    CmpItemKindCopilot     = { fg = c.orange100, bg = c.none },
    CmpItemKindSupermaven  = { fg = c.blue100, bg = c.none },
    CmpItemKindMinuet      = { fg = c.red100, bg = c.none },
    CmpItemKindDefault     = { fg = c.fg_dark, bg = c.none },
    CmpItemKindTabNine     = { fg = c.gray300, bg = c.none },
    CmpItemMenu            = { fg = c.comment, bg = c.none },
  }

  require("repl69.groups.kinds").kinds(ret, "CmpItemKind%s")

  return ret
end

return M
