local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    BlinkCmpDoc                 = { fg = c.fg, bg = c.bg_float },
    BlinkCmpDocBorder           = { fg = c.border, bg = c.bg_float },
    BlinkCmpGhostText           = { fg = c.gray850 },
    BlinkCmpKindCodeium         = { fg = c.gray400, bg = c.none },
    BlinkCmpKindCopilot         = { fg = c.gray400, bg = c.none },
    BlinkCmpKindDefault         = { fg = c.gray500, bg = c.none },
    BlinkCmpKindSupermaven      = { fg = c.gray400, bg = c.none },
    BlinkCmpKindTabNine         = { fg = c.gray400, bg = c.none },
    BlinkCmpLabel               = { fg = c.fg, bg = c.none },
    BlinkCmpLabelDeprecated     = { fg = c.gray800, bg = c.none, strikethrough = true },
    BlinkCmpLabelMatch          = { fg = c.gray200, bg = c.none },
    BlinkCmpMenu                = { fg = c.fg, bg = c.bg_float },
    BlinkCmpMenuBorder          = { fg = c.border, bg = c.bg_float },
    BlinkCmpSignatureHelp       = { fg = c.fg, bg = c.bg_float },
    BlinkCmpSignatureHelpBorder = { fg = c.border, bg = c.bg_float },
    
    -- LSP completion item kinds for blink
    BlinkCmpKindText          = { fg = c.gray100 },
    BlinkCmpKindMethod        = { fg = c.gray200 },
    BlinkCmpKindFunction      = { fg = c.gray200 },
    BlinkCmpKindConstructor   = { fg = c.gray200 },
    BlinkCmpKindField         = { fg = c.gray300 },
    BlinkCmpKindVariable      = { fg = c.gray100 },
    BlinkCmpKindClass         = { fg = c.gray200 },
    BlinkCmpKindInterface     = { fg = c.gray200 },
    BlinkCmpKindModule        = { fg = c.gray300 },
    BlinkCmpKindProperty      = { fg = c.gray300 },
    BlinkCmpKindUnit          = { fg = c.gray400 },
    BlinkCmpKindValue         = { fg = c.gray400 },
    BlinkCmpKindEnum          = { fg = c.gray300 },
    BlinkCmpKindKeyword       = { fg = c.gray200 },
    BlinkCmpKindSnippet       = { fg = c.gray400 },
    BlinkCmpKindColor         = { fg = c.gray300 },
    BlinkCmpKindFile          = { fg = c.gray300 },
    BlinkCmpKindReference     = { fg = c.gray300 },
    BlinkCmpKindFolder        = { fg = c.gray300 },
    BlinkCmpKindEnumMember    = { fg = c.gray400 },
    BlinkCmpKindConstant      = { fg = c.gray400 },
    BlinkCmpKindStruct        = { fg = c.gray200 },
    BlinkCmpKindEvent         = { fg = c.gray300 },
    BlinkCmpKindOperator      = { fg = c.gray300 },
    BlinkCmpKindTypeParameter = { fg = c.gray200 },
  }
end

return M