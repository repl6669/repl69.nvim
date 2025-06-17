local M = {}

M.url = "https://github.com/nvim-neotest/neotest"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    NeotestAdapterName  = { fg = c.gray300, bold = styles.keywords.bold },
    NeotestBorder       = { fg = c.gray200 },
    NeotestDir          = { fg = c.gray200 },
    NeotestExpandMarker = { fg = c.gray500 },
    NeotestFailed       = { fg = c.red500 },
    NeotestFile         = { fg = c.gray400 },
    NeotestFocused      = { fg = c.gray100 },
    NeotestIndent       = { fg = c.gray500 },
    NeotestMarked       = { fg = c.gray200 },
    NeotestNamespace    = { fg = c.gray300 },
    NeotestPassed       = { fg = c.green500 },
    NeotestRunning      = { fg = c.gray400 },
    NeotestSkipped      = { fg = c.gray200 },
    NeotestTarget       = { fg = c.gray200 },
    NeotestTest         = { fg = c.gray500 },
    NeotestWinSelect    = { fg = c.gray200 },
  }
end

return M

