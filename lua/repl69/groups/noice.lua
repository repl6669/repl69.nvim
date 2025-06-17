local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NoiceCmdlineIconInput          = { fg = c.gray400 },
    NoiceCmdlineIconLua            = { fg = c.gray200 },
    NoiceCmdlinePopupBorderInput   = { fg = c.gray400 },
    NoiceCmdlinePopupBorderLua     = { fg = c.gray200 },
    NoiceCmdlinePopupTitleInput    = { fg = c.gray400 },
    NoiceCmdlinePopupTitleLua      = { fg = c.gray200 },
    NoiceCompletionItemKindDefault = { fg = c.gray500, bg = c.none },
    -- LSP completion item kinds for noice
    NoiceCompletionItemKindText          = { fg = c.gray100 },
    NoiceCompletionItemKindMethod        = { fg = c.gray200 },
    NoiceCompletionItemKindFunction      = { fg = c.gray200 },
    NoiceCompletionItemKindConstructor   = { fg = c.gray200 },
    NoiceCompletionItemKindField         = { fg = c.gray300 },
    NoiceCompletionItemKindVariable      = { fg = c.gray100 },
    NoiceCompletionItemKindClass         = { fg = c.gray200 },
    NoiceCompletionItemKindInterface     = { fg = c.gray200 },
    NoiceCompletionItemKindModule        = { fg = c.gray300 },
    NoiceCompletionItemKindProperty      = { fg = c.gray300 },
    NoiceCompletionItemKindUnit          = { fg = c.gray400 },
    NoiceCompletionItemKindValue         = { fg = c.gray400 },
    NoiceCompletionItemKindEnum          = { fg = c.gray300 },
    NoiceCompletionItemKindKeyword       = { fg = c.gray200 },
    NoiceCompletionItemKindSnippet       = { fg = c.gray400 },
    NoiceCompletionItemKindColor         = { fg = c.gray300 },
    NoiceCompletionItemKindFile          = { fg = c.gray300 },
    NoiceCompletionItemKindReference     = { fg = c.gray300 },
    NoiceCompletionItemKindFolder        = { fg = c.gray300 },
    NoiceCompletionItemKindEnumMember    = { fg = c.gray400 },
    NoiceCompletionItemKindConstant      = { fg = c.gray400 },
    NoiceCompletionItemKindStruct        = { fg = c.gray200 },
    NoiceCompletionItemKindEvent         = { fg = c.gray300 },
    NoiceCompletionItemKindOperator      = { fg = c.gray300 },
    NoiceCompletionItemKindTypeParameter = { fg = c.gray200 },
  }
end

return M

