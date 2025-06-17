local M = {}

M.url = "https://github.com/MagicDuck/grug-far.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    GrugFarHelpHeader               = { fg = c.comment },
    GrugFarHelpHeaderKey            = { fg = c.orange300 },
    GrugFarResultsAddIndicator      = { fg = c.git.add },
    GrugFarResultsChangeIndicator   = { fg = c.git.change },
  }
end

return M
