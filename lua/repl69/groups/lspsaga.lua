local M = {}

M.url = "https://github.com/glepnir/lspsaga.nvim"

function M.get(c, opts)
  -- stylua: ignore
  return {
    DefinitionCount            = { fg = c.gray300 },
    DefinitionIcon             = { fg = c.gray400 },
    DiagnosticInformation      = "DiagnosticInfo",
    DiagnosticWarning          = "DiagnosticWarn",
    LspFloatWinBorder          = { fg = c.border_highlight },
    LspFloatWinNormal          = { bg = c.bg_float },
    LspSagaBorderTitle         = { fg = c.gray200 },
    LspSagaCodeActionBorder    = { fg = c.gray400 },
    LspSagaCodeActionContent   = { fg = c.gray300 },
    LspSagaCodeActionTitle     = { fg = c.gray100 },
    LspSagaDefPreviewBorder    = { fg = c.gray500 },
    LspSagaFinderSelection     = { fg = c.bg_visual },
    LspSagaHoverBorder         = { fg = c.gray400 },
    LspSagaRenameBorder        = { fg = c.gray500 },
    LspSagaSignatureHelpBorder = { fg = c.gray600 },
    ReferencesCount            = { fg = c.gray300 },
    ReferencesIcon             = { fg = c.gray400 },
    TargetWord                 = { fg = c.gray200 },
  }
end

return M
