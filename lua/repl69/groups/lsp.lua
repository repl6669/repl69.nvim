local M = {}

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- LSP
    LspCodeLens                 = { fg = c.gray600 },
    LspCodeLensSeparator        = { fg = c.gray750 },
    LspInlayHint                = "Comment",
    LspReferenceRead            = "Visual",
    LspReferenceText            = "Visual",
    LspReferenceWrite           = "Visual",
  }
end

return M