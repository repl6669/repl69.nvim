local M = {}

M.url = "https://github.com/stevearc/aerial.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide  = { fg = c.gray800 },
    AerialLine   = "LspInlayHint",
    
    -- LSP symbol kinds for aerial
    AerialTextIcon          = { fg = c.gray100 },
    AerialMethodIcon        = { fg = c.gray200 },
    AerialFunctionIcon      = { fg = c.gray200 },
    AerialConstructorIcon   = { fg = c.gray200 },
    AerialFieldIcon         = { fg = c.gray300 },
    AerialVariableIcon      = { fg = c.gray100 },
    AerialClassIcon         = { fg = c.gray200 },
    AerialInterfaceIcon     = { fg = c.gray200 },
    AerialModuleIcon        = { fg = c.gray300 },
    AerialPropertyIcon      = { fg = c.gray300 },
    AerialUnitIcon          = { fg = c.gray400 },
    AerialValueIcon         = { fg = c.gray400 },
    AerialEnumIcon          = { fg = c.gray300 },
    AerialKeywordIcon       = { fg = c.gray200 },
    AerialSnippetIcon       = { fg = c.gray400 },
    AerialColorIcon         = { fg = c.gray300 },
    AerialFileIcon          = { fg = c.gray300 },
    AerialReferenceIcon     = { fg = c.gray300 },
    AerialFolderIcon        = { fg = c.gray300 },
    AerialEnumMemberIcon    = { fg = c.gray400 },
    AerialConstantIcon      = { fg = c.gray400 },
    AerialStructIcon        = { fg = c.gray200 },
    AerialEventIcon         = { fg = c.gray300 },
    AerialOperatorIcon      = { fg = c.gray300 },
    AerialTypeParameterIcon = { fg = c.gray200 },
  }
end

return M